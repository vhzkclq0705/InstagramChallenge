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
    
    let idTextView: CustomTextView = {
        let textView = CustomTextView()
        textView.text = "전화번호, 사용자 이름 또는 이메일"
        textView.textColor = .darkGray
        
        return textView
    }()
    
    let passwordTextView: CustomTextView = {
        let textView = CustomTextView()
        textView.text = "비밀번호"
        textView.textColor = .darkGray
        
        return textView
    }()
    
    let secureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeEye"), for: .normal)
        button.setImage(UIImage(named: "oepnEye"), for: .selected)
        button.tintColor = .clear
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        button.setTitleColor(UIColor(named: "enabledColor"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "disabledColor")
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    let leftBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "textViewBorderColor")
        
        return view
    }()
    
    let rightBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "textViewBorderColor")
        
        return view
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakaoLogin"), for: .normal)
        
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
        setLayout()
    }
    
    // MARK: - Setup

    func addViews() {
        [
            topLogoImageView,
            idTextView,
            passwordTextView,
            secureButton,
            forgotPasswordButton,
            loginButton,
            leftBorderView,
            orLabel,
            rightBorderView,
            kakaoLoginButton,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func setLayout() {
        topLogoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.55)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(100)
        }
        
        idTextView.snp.makeConstraints {
            $0.top.equalTo(topLogoImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextView.snp.makeConstraints {
            $0.top.equalTo(idTextView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(idTextView)
            $0.height.equalTo(idTextView)
        }
        
        secureButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextView)
            $0.trailing.equalTo(passwordTextView).offset(-10)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        orLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
        
        leftBorderView.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(orLabel.snp.leading).offset(-20)
            $0.height.equalTo(1)
        }
        
        rightBorderView.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalTo(orLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
        }
    }
}
