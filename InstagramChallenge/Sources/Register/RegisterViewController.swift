//
//  RegisterViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class RegisterViewController: UIViewController {
    
    // MARK: - Property
    
    let registerView = RegisterView()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }
    
    // MARK: - Funcs
    
    func setViewController() {
        registerView.kakaoLoginButton.addTarget(
            self,
            action: #selector(didTapKakaoLoginButton(_:)),
            for: .touchUpInside)
        registerView.registerButton.addTarget(
            self,
            action: #selector(didTapRegisterButton(_:)),
            for: .touchUpInside)
        registerView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    func loginWithKakaoAccount() {
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            } else {
                if let accessToken = oauthToken?.accessToken {
                    token = accessToken
                    
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @objc func didTapKakaoLoginButton(_ sender: Any) {
        loginWithKakaoAccount()
    }
    
    @objc func didTapRegisterButton(_ sender: Any) {
        
    }
    
    @objc func didTapLoginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
