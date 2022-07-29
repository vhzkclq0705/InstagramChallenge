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
    let manager = RegisterManager.shared
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
        
        certificationView.certificationTextField.delegate = self
        
        certificationView.certificationTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        certificationView.changeNumberButton.addTarget(
            self,
            action: #selector(didTapBackButton(_:)),
            for: .touchUpInside)
        certificationView.emailButton.addTarget(
            self,
            action: #selector(didTapBackButton(_:)),
            for: .touchUpInside)
        certificationView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        certificationView.backButton.addTarget(
            self,
            action: #selector(didTapBackButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let text = textField.text else { return }
        let check: Bool = text.count == 6
        
        certificationView.nextButton.changeState(check)
        
        if text.count > 6 {
            textField.deleteBackward()
        }
    }
    
    @objc func didTapNextButton(_ sender: Any) {
        if certificationView.certificationTextField.text! == "123456" {
            manager.setPhoneNumber(phoneNumber)
            let vc = AddNameViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            presentBasicAlert("인증 코드가 올바르지 않습니다.")
        }
    }
    
    @objc func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TextField

extension CertificationViewController: UITextFieldDelegate {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String)
    -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
