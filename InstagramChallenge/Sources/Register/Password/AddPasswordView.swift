//
//  AddPasswordView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class AddPasswordView: BaseView {
    
    // MARK: - UI
    
    let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 만들기"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "비밀번호"
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let nextButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("다음")
        
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
        label.text = "이미 계정이 있으신가요?"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        [
            titleLabel,
            passwordTextField,
            nextButton
        ]
            .forEach { topStackView.addArrangedSubview($0) }
        
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topStackView,
            bottomBorderView,
            bottomStackView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(50)
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
