//
//  TopHeadlinesModel.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation

struct TopHeadlinesModel: Codable {
    let status: String
    let totalResults: Int
    var articles: [TopHeadlinesArticles]
}

// MARK: - Article
struct TopHeadlinesArticles: Codable {
    let source: Source
    let author, title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case googleNews = "google-news"
}

enum Name: String, Codable {
    case googleNews = "Google News"
}
