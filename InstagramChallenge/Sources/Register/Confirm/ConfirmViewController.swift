//
//  ConfirmViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/30.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class ConfirmViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let confirmView = ConfirmView()
    let manager = RegisterManager.shared
    var nickname = ""
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = confirmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup

    func configureViewController() {
        confirmView.titleLabel.text = "\(nickname)\n님으로 가입하시겠어요?"
        
        confirmView.registerButton.addTarget(
            self,
            action: #selector(didTapRegisterButton(_:)),
            for: .touchUpInside)
        confirmView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Func
    
 
    
    // MARK: - Action
    
    @objc func didTapRegisterButton(_ sender: Any) {
        manager.registerOneSelf() { isSuccess in
            if isSuccess {
                let vc = HomeViewController()
                self.view.window?.rootViewController = vc
                self.view.window?.rootViewController?.dismiss(animated: false)
            } else {
                self.presentBasicAlert("알 수 없는 오류가 발생하였습니다.\n다시 시도해주세요.")
                self.dismiss(animated: true)
            }
        }
    }
}
