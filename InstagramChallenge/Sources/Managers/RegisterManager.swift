//
//  RegisterManager.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/30.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Foundation

class RegisterManager {
    
    // MARK: - Init
    
    static let shared = RegisterManager()
    
    private init() { }
    
    // MARK: - Property
    
    var isKakao = false
    var accessToken: String?
    var name: String?
    var password: String?
    var id: String?
    var birthDate: String?
    var phoneNumber: String?
    
    // MARK: - Func
    
    func setAccessToken(_ accessToken: String) {
        self.accessToken = accessToken
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setPassword(_ password: String) {
        self.password = password
    }
    
    func setID(_ id: String) {
        self.id = id
    }
    
    func setBirthDate(_ date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        self.birthDate = formatter.string(from: date)
    }
    
    func setPhoneNumber(_ phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func registerOneSelf(completion: @escaping (Bool) -> Void) {
        guard let name = name,
              let passowrd = password,
              let id = id,
              let birthDate = birthDate,
              let phoneNumber = phoneNumber else {
            completion(false)
            return
        }
        
        let parameter = [
            "realName": name,
            "password": passowrd,
            "loginId": id,
            "birthDate": birthDate,
            "phoneNumber": phoneNumber
        ]
        
        API.signUp(parameter) { result in
            let manager = TokenManager.shared
            switch result {
            case .success(let jwt):
                manager.saveToken(jwt.jwt)
                manager.saveLoginID(id)
                completion(true)
            case .fail(_):
                completion(false)
            }
        }
    }
    
    func registerKakao(completion: @escaping (Bool) -> Void) {
        guard let accessToken = accessToken,
              let name = name,
              let id = id,
              let birthDate = birthDate,
              let phoneNumber = phoneNumber else {
            completion(false)
            return
        }
        
        let parameter = [
            "accessToken": accessToken,
            "realName": name,
            "loginId": id,
            "birthDate": birthDate,
            "phoneNumber": phoneNumber
        ]
        
        API.kakaoSignUp(parameter) { result in
            let manager = TokenManager.shared
            switch result {
            case .success(let jwt):
                manager.saveToken(jwt.jwt)
                manager.saveLoginID(id)
                completion(true)
            case .fail(_):
                completion(false)
            }
        }
    }
    
}
