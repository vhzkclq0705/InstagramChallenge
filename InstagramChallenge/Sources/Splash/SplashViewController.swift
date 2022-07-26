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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.checkLogin()
        }
    }
    
    
    // MARK: - Func
    
    func checkLogin() {
        // 자동 로그인 분기 구현
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        
        self.present(loginViewController, animated: true)
    }
}
