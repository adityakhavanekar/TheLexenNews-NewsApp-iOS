//
//  Constants.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import Foundation

struct Constants{
//    CELLS
    static let BreakingNewsHeaderTableViewCell = "BreakingNewsHeaderTableViewCell"
    static let BreakingNewsTableViewCell = "BreakingNewsTableViewCell"
    static let BreakingNewsCollectionViewCell = "BreakingNewsCollectionViewCell"
    static let RecomendationsTableViewCell = "RecomendationsTableViewCell"
    static let CountryCollectionVIewCell = "CountryCollectionVIewCell"
    
    static let recomendations = "Recomendations"
    static let trending = "Trending"
    static let error = "Error"
    
//    COUNTRY
    static let any = "Any"
    static let countryUs = "United States"
    static let countryIndia = "India"
    static let countryGermany = "Germany"
    static let countryChina = "China"
    
//    KEYWORDS
    static let all = "All"
    static let politics = "Politics"
    static let sports = "Sports"
    static let education = "Education"
    static let gaming = "Gaming"
}

enum TypeOfNews{
    case everything
    case topHeadlines
}
