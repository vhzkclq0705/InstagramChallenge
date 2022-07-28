//
//  UIViewController++Extensions.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentFullScreen(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController()
        view.window?.rootViewController = loginViewController
        view.window?.rootViewController?.dismiss(animated: false)
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
