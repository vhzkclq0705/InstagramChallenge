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
        loginView.idTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        loginView.passwordTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
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
        loginView.registerButton.addTarget(
            self,
            action: #selector(didTapRegisterButton(_:)),
            for: .touchUpInside)
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
    
    func changeLoginButtonState(_ bool: Bool) {
        if bool {
            loginView.loginButton.isUserInteractionEnabled = true
            loginView.loginButton.backgroundColor = UIColor(named: "enabledColor")
        } else {
            loginView.loginButton.isUserInteractionEnabled = false
            loginView.loginButton.backgroundColor = UIColor(named: "disabledColor")
        }
    }
    
    // MARK: - Actions
    
    @objc func didTapLoginButton(_ sender: Any) {
        
    }
    
    @objc func didTapKakaoLoginButton(_ sender: Any) {
        loginWithKakaoAccount()
    }
    
    @objc func didTapSecureButton(_ button: UIButton) {
        button.isSelected = !button.isSelected
        loginView.passwordTextField.isSecureTextEntry = button.isSelected
    }
    
    @objc func didTapForgotPasswordButton(_ sender: Any) {
        
    }
    
    @objc func didTapRegisterButton(_ sender: Any) {
        
    }
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let idText = loginView.idTextField.text,
              let passwordText = loginView.passwordTextField.text else { return }
        
        if idText.isEmpty == false && passwordText.isEmpty == false {
            changeLoginButtonState(true)
        } else {
            changeLoginButtonState(false)
        }
        
        guard let text = textField.text else { return }
        
        if text.count > 20 {
            textField.deleteBackward()
        }
    }
}
