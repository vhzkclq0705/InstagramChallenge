//
//  Address.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

enum Address {
    // User
    case signUp
    case signIn
    case kakaoSignUp
    case kakaoSignIn
    case autoSignIn
    case duplicateID
    case myPage
    // Feed
    case searchingFeed
    case searchingUser
    case createFeed
    case updateFeed
    case deleteFeed
    case searchingComments
    case createComments
    // Chat
    case searchingChats
    case sendChats
    
    var url: String {
        switch self {
        case .signUp: return "sign-up"
        case .signIn: return "sign-in"
        case .kakaoSignUp: return "kakao-sign-up"
        case .kakaoSignIn: return "kakao-sign-in"
        case .autoSignIn: return "auto-sign-in"
        case .duplicateID: return "check-duplicate-login-id?loginId="
        case .myPage: return "users/"
        case .searchingFeed: return "feeds?pageIndex="
        case .searchingUser: return "feeds/user?pageIndex="
        case .createFeed: return "feed"
        case .updateFeed,
                .deleteFeed,
                .searchingComments,
                .createComments: return "feeds/"
        case .searchingChats: return "chats?pageIndex="
        case .sendChats: return "chat"
        }
    }
}
