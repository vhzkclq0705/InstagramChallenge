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
    
    var name: String?
    var password: String?
    var id: String?
    var birthDate: String?
    var phoneNumber: String?
    
    // MARK: - Func
    
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
            print("정보 입력 필요")
            return
        }
        
        let parameter = [
            "realName": name,
            "password": passowrd,
            "loginId": id,
            "birthDate": birthDate,
            "phoneNumber": phoneNumber
        ]
        
        print("파라미터: \(parameter)")
        
        API.signUp(parameter) { jwt in
            if let jwt = jwt {
                TokenManager.shared.saveToken(jwt)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
