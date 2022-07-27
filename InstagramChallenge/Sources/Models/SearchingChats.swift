//
//  SearchingChats.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct SearchingChats: Codable {
    let chatID: Int
    let userID: Int
    let content: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case chatID = "chatId"
        case userID = "userId"
        case content, createdAt, updatedAt
    }
}
