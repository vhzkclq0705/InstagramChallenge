//
//  MyPage.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct MyPage: Codable {
    let loginID: String
    let realName: String
    let follower: Int
    let following: Int
    let feedCount: Int
    
    enum CodingKeys: String, CodingKey {
        case realName, feedCount
        case loginID = "loginId"
        case follower = "followerCount"
        case following = "followingCount"
    }
}
