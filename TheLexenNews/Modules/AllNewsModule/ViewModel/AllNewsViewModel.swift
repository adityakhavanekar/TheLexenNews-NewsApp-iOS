//
//  AllNewsViewModel.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/10/24.
//

import Foundation

class AllNewsViewModel{
    
    private var topHeadlines:TopHeadlinesModel?
    private var everything:EverythingModel?
    var countries:[String] = [Constants.any,Constants.countryUs,Constants.countryIndia,Constants.countryGermany,Constants.countryChina]
    
    func getTopHeadlines(country:APICountryParams,completion:@escaping (Bool) -> ()){
        NetworkManager.shared.request(url: APIEndpoints.topHeadlines.url, method: .get, params: country.value, headers: APIHeaders.authorization.value, body: nil, bodyType: .json) { result in
            switch result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(TopHeadlinesModel.self, from: data)
                    print(json)
                    self.topHeadlines = json
                    completion(true)
                }
                catch(let error){
                    print("\(NetworkErrors.decodingError)\(error)")
                    completion(false)
                }
            case .failure(let error):
                print("\(NetworkErrors.APICallError)\(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func getEverything(completion:@escaping (Bool) -> ()){
        NetworkManager.shared.request(url: APIEndpoints.everything.url, method: .get, params: APIParams.keyword.value, headers: APIHeaders.authorization.value, body: nil, bodyType: .json) { result in
            switch result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(EverythingModel.self, from: data)
                    self.everything = json
                    completion(true)
                }catch(let error){
                    print("\(NetworkErrors.decodingError)\(error)")
                    completion(false)
                }
            case .failure(let error):
                print("\(NetworkErrors.APICallError)\(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func getEverythingArray() -> [EverythingArticle]?{
        return everything?.articles
    }
    
    func getTopNews() -> [TopHeadlinesArticles]? {
        return topHeadlines?.articles
    }
    
    func getCountries() -> [String] {
        return countries
    }
}
