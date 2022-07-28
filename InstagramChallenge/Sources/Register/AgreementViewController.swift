//
//  AgreementViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class AgreementViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let agreementView = AgreementView()
    
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = agreementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup

    func configureViewController() {
        
    }
}
