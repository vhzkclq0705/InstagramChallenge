//
//  LoginView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class LoginView: UIView {

    // MARK: - UI
    
    let topLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topLogo")
        
        return imageView
    }()
    
    let idTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "전화번호, 사용자 이름 또는 이메일"
        
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let secureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeEye"), for: .selected)
        button.setImage(UIImage(named: "openEye"), for: .normal)
        button.isSelected = true
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        
        return button
    }()
    
    let loginButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("로그인")
        
        return button
    }()
    
    let orView = OrView()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "kakaoLogin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    let bottomBorderView = GrayBorderView()
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "계정이 없으신가요?"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureLayout()
    }
    
    // MARK: - Setup

    func addViews() {
        [questionLabel, registerButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topLogoImageView,
            idTextField,
            passwordTextField,
            secureButton,
            forgotPasswordButton,
            loginButton,
            orView,
            kakaoLoginButton,
            bottomBorderView,
            bottomStackView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        topLogoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.55)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(topLogoImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        
        secureButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField).offset(-10)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        orView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(orView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(bottomStackView.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
}
