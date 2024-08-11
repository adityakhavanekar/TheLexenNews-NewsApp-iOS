//
//  NetworkConstants.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/9/24.
//

import Foundation

enum Environment{
    case production
    case test
}

let environment : Environment = .test

enum APIEndpoints: String {
    private var baseUrl:String {
        switch environment {
        case .production:
            return "https://newsapi.org/v2/"
        case .test:
            return "https://newsapi.org/v2/"
        }
    }

    case topHeadlines = "top-headlines"
    case everything = "everything"
    
    var url: URL {
        guard let url = URL(string: baseUrl) else {
            preconditionFailure("The url used in \(APIEndpoints.self) is not valid")
        }
        return url.appendingPathComponent(self.rawValue)
    }
}

enum APIHeaders {
    
    case authorization
    
    var value: [String: String] {
        switch self {
        case .authorization:
            return ["Authorization": "d111e16bfaa94d68a0cd16efb74636d0"]
        }
    }
}

enum APICountryParams{
    
    case countryUS
    case countryIndia
    case countryGermany
    case CountryChina
    
    var value:[String:String]{
        switch self{
        case .countryUS:
            return ["country":"us"]
        case .countryIndia:
            return ["country":"in"]
        case .countryGermany:
            return ["country":"de"]
        case .CountryChina:
            return ["country":"cn"]
        }
    }
}

enum APIParams{
    
    case keyword
    case politics
    case sports
    case education
    case gaming
    
    var value:[String:String]{
        switch self{
        case .keyword:
            return ["q":"keyword"]
        case .politics:
            return ["q":"politics"]
        case .sports:
            return ["q":"sports"]
        case .education:
            return ["q":"education"]
        case .gaming:
            return ["q":"gaming"]
        }
    }
    
}

struct NetworkErrors{
    static let decodingError = "Decoding Error : "
    static let APICallError = "API Calling Error : "
}
