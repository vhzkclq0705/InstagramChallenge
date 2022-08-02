//
//  JWT.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct JWT: Codable {
    let jwt: String
    let loginID: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jwt = (try? values.decode(String.self, forKey: .jwt)) ?? ""
        loginID = (try? values.decode(String.self, forKey: .loginID)) ?? nil
    }
}
