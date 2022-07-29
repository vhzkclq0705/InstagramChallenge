//
//  AddNicknameViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class AddNicknameViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let addNicknameView = AddNicknameView()
    var isCheck = false
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = addNicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        addNicknameView.nicknameTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        addNicknameView.textFieldButton.addTarget(
            self,
            action: #selector(didTapTextFieldButton(_:)),
            for: .touchUpInside)
        addNicknameView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        addNicknameView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Func
    
    func changeTextFieldButtonState(_ bool: Bool) {
        addNicknameView.alertLabel.isHidden = true
        addNicknameView.nicknameTextField.layer.borderColor = UIColor.customColor(.lightgray).cgColor
        addNicknameView.textFieldButton.isUserInteractionEnabled = !bool
        isCheck = bool
        
        bool
        ? addNicknameView.textFieldButton.setBackgroundImage(
                UIImage(systemName: "checkmark.circle")?
                    .withTintColor(.green, renderingMode: .alwaysOriginal),
                for: .normal)
        : addNicknameView.textFieldButton.setBackgroundImage(
                UIImage(systemName: "x.circle")?
                    .withTintColor(.lightGray, renderingMode: .alwaysOriginal),
                for: .normal)
    }
    
    func alertTextField(_ text: String) {
        addNicknameView.nicknameTextField.layer.borderColor = UIColor.customColor(.red).cgColor
        addNicknameView.alertLabel.isHidden = false
        addNicknameView.alertLabel.text = text
    }
    
    // MARK: - Action

    @objc func didChangeTextField(_ textField: UITextField) {
        changeTextFieldButtonState(false)
        guard let text = textField.text else { return }
        let check = text.count >= 3
        
        addNicknameView.nextButton.changeState(check)
        
        if text.count > 20 {
            textField.deleteBackward()
        }
    }
    
    @objc func didTapTextFieldButton(_ button: UIButton) {
        addNicknameView.nicknameTextField.text?.removeAll()
        addNicknameView.nextButton.changeState(false)
    }
    
    @objc func didTapNextButton(_ sender: Any) {
        if isCheck {
            let vc = ConfirmViewController()
            vc.nickname = addNicknameView.nicknameTextField.text!
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let text = addNicknameView.nicknameTextField.text!
            
            if text == "1234" {
                alertTextField("사용자 이름 \(text)를 사용할 수 없습니다.")
            } else {
                let pattern = "^[a-z0-9_.]*$"
                
                guard text.range(of: pattern, options: .regularExpression) != nil else {
                    alertTextField("아이디는 영어, 숫자, '_', '.'만 사용 가능합니다.")
                    return
                }
                
                changeTextFieldButtonState(true)
            }
        }
    }
    
}
