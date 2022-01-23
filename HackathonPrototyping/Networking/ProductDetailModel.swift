//
//  ProductDetailModel.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 23.01.22.
//

import Foundation

// MARK: - ProductDetailModel
struct ProductDetailModel {
    let id: Int
    let title, productDetailModelDescription: String
    let upvotes: Int
    let category: Category
    let tags: [Tag]
    let owners: [Any?]
    let images: [Image]
    let comments: [Comment]
}

// MARK: - Category
struct Category {
    let id: Int
    let title: String
    let imageURL: String
    let type: String
}

// MARK: - Comment
struct Comment {
    let id: Int
    let fullName, comment: String
}

// MARK: - Image
struct Image {
    let id: Int
    let imageURL: String
}

// MARK: - Tag
struct Tag {
    let id: Int
    let title: String
}
