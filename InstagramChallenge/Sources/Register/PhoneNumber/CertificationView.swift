//
//  CertificationView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class CerticiationView: UIView {
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let changeNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("전화번호 변경", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        
        return label
    }()
    
    let emailButton: UIButton = {
        let button = UIButton()
        button.setTitle("SMS 재전송.", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        
        return button
    }()
    
    let certificationTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "인증 코드"
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    let nextButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("다음")
        
        return button
    }()
    
    let bottomBorderView = GrayBorderView()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("돌아가기", for: .normal)
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
        [
            titleLabel,
            changeNumberButton,
            orLabel,
            emailButton,
            certificationTextField,
            nextButton,
            bottomBorderView,
            backButton,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        orLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        changeNumberButton.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.trailing.equalTo(orLabel.snp.leading).offset(-5)
        }
        
        emailButton.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalTo(orLabel.snp.trailing).offset(5)
        }
        
        certificationTextField.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(certificationTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(backButton.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
}
