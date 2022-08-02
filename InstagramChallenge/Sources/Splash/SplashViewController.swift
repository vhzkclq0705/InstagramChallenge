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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            //self.checkAutoLogin()
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
                vc = HomeViewController()
                print("자동 로그인 성공")
            } else {
                vc = LoginViewController()
                print("자동 로그인 실패")
            }
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
        }
    }
}
