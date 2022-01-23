//
//  HomeModel.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 23.01.22.
//

import Foundation

struct HomeModel: Codable {
    let title: String
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let title: String
    let imageURL: String?
    let upvotes: Int
    let itemDescription, companyTitle: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
        case upvotes
        case itemDescription = "description"
        case companyTitle
    }
}

