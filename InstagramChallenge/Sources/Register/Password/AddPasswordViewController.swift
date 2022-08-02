//
//  AddPasswordViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class AddPasswordViewController: HideBackButtonViewController {
    
    // MARK: - Property
    
    let addPasswordView = AddPasswordView()
    let manager = RegisterManager.shared
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = addPasswordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        addPasswordView.passwordTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        addPasswordView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        addPasswordView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        addPasswordView.nextButton.changeState(!text.isEmpty)
        
        if text.count > 20 {
            textField.deleteBackward()
        }
    }
    
    @objc func didTapNextButton(_ sender: Any) {
        let text = addPasswordView.passwordTextField.text!
        
        if text.count < 6 {
            presentBasicAlert("비밀번호를 확인해주세요.")
        } else {
            let pattern = "[~!@#\\$%\\^&\\*]"
            
            guard text.range(of: pattern, options: .regularExpression) != nil else {
                    presentBasicAlert("비밀번호를 확인해주세요.")
                    return
                }
            
            manager.setPassword(text)
            let vc = BirthdayViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
