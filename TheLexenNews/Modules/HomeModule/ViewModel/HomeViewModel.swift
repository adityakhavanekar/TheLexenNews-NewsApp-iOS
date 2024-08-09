//
//  HomeViewModel.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation

class HomeViewModel{
    
    private var topHeadlines:TopHeadlinesModel?
    private var everything:EverythingModel?
    
    func getTopHeadlines(completion:@escaping (Bool) -> ()){
        NetworkManager.shared.request(url: APIEndpoints.topHeadlines.url, method: .get, params: APICountryParams.countryUS.value, headers: APIHeaders.authorization.value, body: nil, bodyType: .json) { result in
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
    
    func getTop5Headlines()->[TopHeadlinesArticles]?{
        guard let top5Headlines = topHeadlines?.articles.prefix(5) else { return nil }
        return Array(top5Headlines)
    }
    
    func getTop5EverythingNews() -> [EverythingArticle]?{
        guard let top5EverythingArticles = everything?.articles?.prefix(5) else {return nil}
        return Array(top5EverythingArticles)
    }
}
