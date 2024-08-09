//
//  HomeViewModel.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation

class HomeViewModel{
    
    var topHeadlines:TopHeadlinesModel?
    
    func getTopHeadlines(completion:@escaping (Bool) -> ()){
        NetworkManager.shared.request(url: APIEndpoints.topHeadlines.url, method: .get, params: APICountryParams.countryUS.value, headers: APIHeaders.authorization.value, body: nil, bodyType: .json) { result in
            switch result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(TopHeadlinesModel.self, from: data)
                    print(json)
                }
                catch(let error){
                    print("\(NetworkErrors.decodingError)\(error)")
                }
            case .failure(let error):
                print("\(NetworkErrors.APICallError)\(error.localizedDescription)")
            }
        }
    }
}
