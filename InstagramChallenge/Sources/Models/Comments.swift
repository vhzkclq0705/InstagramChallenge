//
//  Comments.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct Comments: Codable {
    let id: Int
    let loginID: String
    let text: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, updatedAt
        case loginID = "loginId"
        case text = "commentText"
    }
}
