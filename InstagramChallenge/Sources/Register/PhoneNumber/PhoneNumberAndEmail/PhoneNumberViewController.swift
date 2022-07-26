//
//  PhoneNumberViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

protocol certificationDelegate {
    func pushCertificationViewController(_ phoneNumber: String)
}

class PhoneNumberViewController: UIViewController {

    // MARK: - Property
    
    let phoneNumberView = PhoneNumberView()
    let manager = RegisterManager.shared
    var delegate: certificationDelegate?
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = phoneNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        phoneNumberView.phoneNumberTextField.delegate = self
        
        phoneNumberView.phoneNumberTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .editingChanged)
        phoneNumberView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        phoneNumberView.kakaoLoginButton.addTarget(
            self,
            action: #selector(didTapKakaoLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        phoneNumberView.nextButton.changeState(!text.isEmpty)
        
        if text.count > 11 {
            textField.deleteBackward()
        }
    }
    
    @objc func didTapNextButton(_ button: UIButton) {
        let phoneNumber = phoneNumberView.phoneNumberTextField.text!
        
        manager.setPhoneNumber(phoneNumber)
        delegate?.pushCertificationViewController("+82\(phoneNumber)")
    }

    @objc func didTapKakaoLoginButton(_ sender: Any) {
        kakaoLogin(3)
    }
    
}

// MARK: - TextField

extension PhoneNumberViewController: UITextFieldDelegate {
    
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
