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
        
    }
}
