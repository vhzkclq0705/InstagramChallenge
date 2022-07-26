//
//  LoginViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/26.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    
    // MARK: - Property
    
    let loginView = LoginView()
    var password = ""
    var secure = true
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }

    // MARK: - Funcs
    func setViewController() {
        loginView.idTextView.delegate = self
        loginView.passwordTextView.delegate = self
        
        loginView.secureButton.addTarget(
            self,
            action: #selector(didTapSecureButton(_:)),
            for: .touchUpInside)
        loginView.forgotPasswordButton.addTarget(
            self,
            action: #selector(didTapForgotPasswordButton(_:)),
            for: .touchUpInside)
        loginView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(
            self,
            action: #selector(didTapKakaoLoginButton(_:)),
            for: .touchUpInside)
    }
    
    func checkKakaoToken() {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { accessTokenInfo, error in
                if let error = error {
                    if let sdkError = error as? SdkError,
                       sdkError.isInvalidTokenError() == true {
                        self.loginWithKakaoAccount()
                    }
                    else {
                        //기타 에러
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                }
            }
        }
        else {
            loginWithKakaoAccount()
        }
    }
    
    func loginWithKakaoAccount() {
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            } else {
                if let accessToken = oauthToken?.accessToken {
                    // 토큰 서버로 전송
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @objc func didTapLoginButton(_ sender: Any) {
        
    }
    
    @objc func didTapKakaoLoginButton(_ sender: Any) {
        checkKakaoToken()
    }
    
    @objc func didTapSecureButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        print("zz")
    }
    
    @objc func didTapForgotPasswordButton(_ sender: Any) {
        
    }
    
    @objc func didTapRegisterButton(_ sender: Any) {
        
    }
}

extension LoginViewController: UITextViewDelegate {
    
}
