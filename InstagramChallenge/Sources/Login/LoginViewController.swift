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
        configureViewController()
    }
    
    // MARK: - Funcs
    
    func configureViewController() {
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
                    token = accessToken
                    
                }
            }
        }
    }
    
    func presentFailAlert() {
        let alertMessage =
        "\(loginView.idTextField.text!)에 연결된 계정을 찾을 수 없습니다."
        + " 다른 전화번호나 이메일 주소를 사용해보세요. Instagram 계정이 없으면 가입할 수 있습니다."
        
        let alert = UIAlertController(
            title: "계정을 찾을 수 없음",
            message: alertMessage,
            preferredStyle: .alert)
        
        let registerAction = UIAlertAction(title: "가입하기", style: .default) { _ in
            self.goToRegisterViewController()
        }
        let cancleAction = UIAlertAction(title: "다시 시도", style: .default)
        
        [registerAction, cancleAction].forEach { alert.addAction($0) }
        
        self.present(alert, animated: false)
    }
    
    func goToRegisterViewController() {
        let vc = RegisterViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        
        presentFullScreen(navigationController)
    }
    
    // MARK: - Actions
    
    @objc func didTapLoginButton(_ sender: Any) {
        if loginView.idTextField.text!.count < 3 {
            presentBasicAlert("아이디를 3자리 이상 입력해주세요.")
        }
        else if loginView.passwordTextField.text!.count < 6 {
            presentBasicAlert("비밀번호를 6자리 이상 입력해주세요.")
        }
        else {
            let pattern = "(?=.*[~!@#\\$%\\^&\\*])"
            
            guard loginView.passwordTextField.text!.range(
                of: pattern, options: .regularExpression) != nil else {
                presentBasicAlert("비밀번호에 특수문자가 1자리 이상 포함되어야 합니다.")
                return
            }
            
            // 로그인 실패
            presentFailAlert()
        }
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
        goToRegisterViewController()
    }
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let idText = loginView.idTextField.text,
              let passwordText = loginView.passwordTextField.text else { return }
        
        if idText.isEmpty == false && passwordText.isEmpty == false {
            loginView.loginButton.changeState(true)
        } else {
            loginView.loginButton.changeState(false)
        }
        
        guard let text = textField.text else { return }
        
        if text.count > 20 {
            textField.deleteBackward()
        }
    }
}
