//
//  UIViewController++Extensions.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

extension UIViewController {
    
    func kakaoLogin(_ vcIndex: Int) {
        let manager = TokenManager.shared
        
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
                self.presentBasicAlert("로그인에 실패하였습니다.")
            } else {
                if let accessToken = oauthToken?.accessToken {
                    let parameter = ["accessToken": accessToken]
                    
                    API.kakaoSignIn(parameter) { result in
                        switch result {
                        case .success(let jwt):
                            manager.saveToken(jwt.jwt)
                            manager.saveLoginID(jwt.loginID!)
                            
                            self.presentFullScreen(HomeViewController())
                        case .fail(let message):
                            self.goToKakaoRegister(accessToken, vcIndex)
//                            if message == "카카오 계정이 존재하지 않습니다." {
//                                self.presentFullScreen(AddPasswordViewController())
//                            } else {
//                                self.presentBasicAlert("로그인에 실패하였습니다.")
//                            }
                        }
                    }
                }
            }
        }
    }
    
    func presentFullScreen(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    func goToLogin() {
        let vc = LoginViewController()
        view.window?.rootViewController = vc
        view.window?.rootViewController?.dismiss(animated: true)
    }
    
    func goToKakaoRegister(_ accessToken: String, _ vcIndex: Int) {
        let registerManager = RegisterManager.shared

        registerManager.isKakao = true
        registerManager.setAccessToken(accessToken)
        
        let registerVC = RegisterViewController()
        let phoneNumberVC = RegisterPhoneNumberBaseViewController()
        let navigationController = UINavigationController(rootViewController: registerVC)
        navigationController.modalPresentationStyle = .fullScreen
        
        switch vcIndex {
        case 1:
            self.present(navigationController, animated: false) {
                navigationController.pushViewController(phoneNumberVC, animated: false)
            }
        case 2:
            self.navigationController?.pushViewController(phoneNumberVC, animated: false)
        default:
            break
        }
        
    }
    
    func presentBasicAlert(_ title: String) {
        let alert = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert)
        
        let cancleAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(cancleAction)
        
        self.present(alert, animated: false)
    }
}
