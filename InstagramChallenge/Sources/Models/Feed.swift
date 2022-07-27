//
//  Feed.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let id: Int
    let loginID: String
    let text: String?
    let createdAt: String
    let updatedAt: String
    let commentsCount: Int
    let contentsList: [Contents]
    
    enum CodingKeys: String, CodingKey {
        case id = "feedId"
        case loginID = "feedLoginId"
        case text = "feedText"
        case createdAt = "feedCreatedAt"
        case updatedAt = "feedUpdatedAt"
        case commentsCount = "feedCommentCount"
        case contentsList
    }
}
