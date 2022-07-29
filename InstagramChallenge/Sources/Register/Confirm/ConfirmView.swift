//
//  ConfirmView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/30.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ConfirmView: BaseView {
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "나중에 언제든지 사용자 이름을 변경할 수 있습니다."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let bottomBorderView = GrayBorderView()
    
    let registerButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("가입하기")
        button.changeState(true)
        
        return button
    }()
    
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
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            titleLabel,
            guideLabel,
            bottomBorderView,
            registerButton,
            bottomStackView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(registerButton.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        registerButton.snp.makeConstraints {
            $0.bottom.equalTo(bottomStackView.snp.top).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
    
}
