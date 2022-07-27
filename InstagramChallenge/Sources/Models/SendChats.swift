//
//  SendChats.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct SendChats: Codable {
    let id: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case content
    }
}
