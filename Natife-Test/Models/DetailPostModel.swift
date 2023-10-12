//
//  DetailPostModel.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import Foundation

struct DetailPostContainer: Codable {
    let post: DetailPostModel
}

struct DetailPostModel: Codable {
    let postId: Int
    let date: Date
    let title: String
    let text: String
    let postImage: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postId, title, text, postImage
        case likesCount = "likes_count"
        case date = "timeshamp"
    }
}
