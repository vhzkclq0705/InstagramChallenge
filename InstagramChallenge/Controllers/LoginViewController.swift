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

    // MARK: - UI
    @IBOutlet weak var idTextView: UITextView!
    @IBOutlet weak var passwordTextView: UITextView!
    
    // MARK: - Property
    var password = ""
    var secure = true
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }

    // MARK: - Funcs
    func setViewController() {
        idTextView.delegate = self
        passwordTextView.delegate = self
        
        
    }
    
    func checkKakaoToken() {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
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
            //로그인 필요
        }
    }
    
    func loginWithKakaoAccount() {
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            }
            else {
                /// 로그인 관련 메소드 추가
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapKakaoLoginButton(_ sender: Any) {
        
        
    }
    
    @IBAction func didTapSecureButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapRegisterButton(_ sender: Any) {
        
    }
}

extension LoginViewController: UITextViewDelegate {
    
}
