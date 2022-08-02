//
//  TokenManager.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/02.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

class TokenManager {
    
    // MARK: - Init
    
    static let shared = TokenManager()
    
    private init() { }
    
    // MARK: - Property
    
    var jwt = ""
    
    // MARK: - Func
    
    func saveToken(_ jwt: String) {
        self.jwt = jwt
        UserDefaults.standard.set(token ,forKey: "jwt")
        print("jwt 저장 완료")
    }
    
    func loadToken() {
        guard let jwt = UserDefaults.standard.string(forKey: "jwt") else {
            print("저장된 jwt가 없음")
            return
        }
        
        self.jwt = jwt
        print("jwt 로드 완료. jwt: \(jwt)")
    }
    
}
