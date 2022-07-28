//
//  CertificationViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class CertificationViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let certificationView = CerticiationView()
    var phoneNumber = ""
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = certificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        certificationView.titleLabel.text = "\(phoneNumber)번으로\n전송된 인증 코드를 입력하세요."
    }
    
    
    // MARK: - Func
    
    
    
    // MARK: - Action

}
