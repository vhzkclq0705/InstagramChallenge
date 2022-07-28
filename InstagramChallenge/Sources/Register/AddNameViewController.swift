//
//  AddNameViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class AddNameViewController: HideBackButtonViewController {
    
    // MARK: - Property
    
    let addNameView = AddNameView()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = addNameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        addNameView.nameTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        addNameView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        addNameView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        addNameView.nextButton.changeState(!text.isEmpty)
        
        if text.count > 20 {
            textField.deleteBackward()
        }
    }
    
    @objc func didTapNextButton(_ sender: Any) {
        let vc = BirthdayViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLoginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
