//
//  PhoneNumberView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class PhoneNumberView: BaseView {
    
    // MARK: - UI
    
    let phoneNumberTextField: CustomTextField = {
        let textField = CustomTextField()
        let paddigView = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 20))
        
        textField.leftView = paddigView
        textField.leftViewMode = .always
        textField.placeholder = "전화번호"
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let baseNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "KR +82"
        label.textColor = UIColor.customColor(.enabled)
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    let dividingView = GrayBorderView()
    
    let nextButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("다음")
        
        return button
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "보안 및 로그인 목적으로 Instagram에서 보내는\n SMS 알림을 수신할 수 있습니다."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let orView = OrView()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "kakaoLogin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
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
            phoneNumberTextField,
            baseNumberLabel,
            dividingView,
            nextButton,
            guideLabel,
            orView,
            kakaoLoginButton,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        baseNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(phoneNumberTextField)
            $0.leading.equalTo(phoneNumberTextField).offset(20)
        }
        
        dividingView.snp.makeConstraints {
            $0.top.bottom.equalTo(phoneNumberTextField).inset(10)
            $0.leading.equalTo(baseNumberLabel.snp.trailing).offset(20)
            $0.width.equalTo(2)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        orView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(orView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
