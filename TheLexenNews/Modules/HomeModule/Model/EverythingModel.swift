//
//  EverythingModel.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/9/24.
//

import Foundation

// MARK: - EverythingModel
struct EverythingModel: Codable {
    let status: String?
    let totalResults: Int?
    var articles: [EverythingArticle]?
}

// MARK: - Article
struct EverythingArticle: Codable {
    let source: EverythingSource?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct EverythingSource: Codable {
    let id: String?
    let name: String?
}
