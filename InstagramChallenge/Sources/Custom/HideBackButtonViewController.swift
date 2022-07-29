//
//  HideBackButtonViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

// MARK: - Hide navigationItem backButton

class HideBackButtonViewController: UIViewController {

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - Action
    
    @objc func didTapLoginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
