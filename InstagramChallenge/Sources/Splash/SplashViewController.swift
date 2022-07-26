//
//  SplashViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - Property
    
    let splashView = SplashView()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTokenAndLoginID()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !RegisterManager.shared.isKakao {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.checkAutoLogin()
            }
        }
    }
    
    // MARK: - Func
    
    func loadTokenAndLoginID() {
        TokenManager.shared.loadTokenAndLoginID()
    }
    
    func checkAutoLogin() {
        API.autoSignIn() { isSuccess in
            var vc: UIViewController
            if isSuccess {
                vc = BaseTabBarController()
                print("자동 로그인 성공")
            } else {
                vc = LoginViewController()
                print("자동 로그인 실패")
            }
            self.view.window?.rootViewController = vc
        }
    }
}
