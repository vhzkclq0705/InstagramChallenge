//
//  Response.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/30.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: T?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isSuccess = (try? values.decode(Bool.self, forKey: .isSuccess)) ?? false
        code = (try? values.decode(Int.self, forKey: .code)) ?? 4001
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        result = (try? values.decode(T.self, forKey: .result)) ?? nil
    }
}
