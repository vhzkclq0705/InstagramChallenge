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
    var loginID = ""
    
    // MARK: - Func
    
    func saveToken(_ jwt: String) {
        self.jwt = jwt
        UserDefaults.standard.set(jwt, forKey: "jwt")
        print("jwt 저장 완료")
    }

    func saveLoginID(_ loginID: String) {
        self.loginID = loginID
        UserDefaults.standard.set(loginID, forKey: "loginID")
        print("loginID 저장 완료")
    }
    
    func loadTokenAndLoginID() {
        guard let jwt = UserDefaults.standard.string(forKey: "jwt"),
              let loginID = UserDefaults.standard.string(forKey: "loginID") else {
            print("저장된 정보가 없음")
            return
        }
        
        self.jwt = jwt
        self.loginID = loginID
        print("정보 로드 완료. jwt: \(jwt), loginID: \(loginID)")
    }
    
    
    
}
