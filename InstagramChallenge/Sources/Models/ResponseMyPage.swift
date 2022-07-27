//
//  ResponseMyPage.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct ResponseMyPage: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MyPage
}
