//
//  NetworkingResult.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

enum NetworkingResult<T> {
    case success(T)
    case fail(String)
}
