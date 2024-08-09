//
//  NetworkManager.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum BodyType {
    case json
    case urlEncoded
}

class NetworkManager {
    
    private init() {}
    
    static let shared = NetworkManager()
    
    func request(url: URL, method: HTTPMethod = .get, params: [String: Any]? = nil, headers: [String: String]? = nil, body: [String: Any]? = nil, bodyType: BodyType = .json, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let params = params {
            var components = URLComponents(string: url.absoluteString)
            components?.queryItems = params.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
            request.url = components?.url
        }
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = body {
            switch bodyType {
            case .json:
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                } catch {
                    completion(.failure(error))
                    return
                }
                
            case .urlEncoded:
                let urlEncodedString = body.map { key, value in
                    return "\(key)=\(String(describing: value))"
                }.joined(separator: "&")
                
                request.httpBody = urlEncodedString.data(using: .utf8)
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "UnknownError", code: -1, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
