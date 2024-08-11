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
    
//    COUNTRY
    static let any = "Any"
    static let countryUs = "United States"
    static let countryIndia = "India"
    static let countryGermany = "Germany"
    static let countryChina = "China"
}

enum TypeOfNews{
    case everything
    case topHeadlines
}
