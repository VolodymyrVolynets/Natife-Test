//
//  PostModel.swift
//  Natife-Test-UIKit
//
//  Created by Vova on 12/10/2023.
//

import Foundation

struct PostModel: Codable, Hashable {
    let postId: Int
    let date: Date
    let title: String
    let previewText: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postId
        case date = "timeshamp"
        case title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
