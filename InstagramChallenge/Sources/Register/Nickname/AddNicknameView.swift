//
//  AddNicknameView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class AddNicknameView: BaseView {
    
    // MARK: - UI
    
    let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자 이름 만들기"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에\n언제든지 변경할 수 있습니다."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    let nicknameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "사용자 이름"
        
        return textField
    }()
    
    let textFieldButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(systemName: "x.circle")?
                .withTintColor(.lightGray, renderingMode: .alwaysOriginal),
            for: .normal)
        
        return button
    }()
    
    let alertLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customColor(.red)
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.isHidden = true
        
        return label
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
        [nicknameTextField, alertLabel]
            .forEach { textFieldStackView.addArrangedSubview($0) }
        
        [
            titleLabel,
            guideLabel,
            textFieldStackView,
            nextButton,
        ]
            .forEach { topStackView.addArrangedSubview($0) }
        
        
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topStackView,
            textFieldButton,
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
        
        nicknameTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        textFieldButton.snp.makeConstraints {
            $0.centerY.equalTo(nicknameTextField)
            $0.trailing.equalTo(nicknameTextField).offset(-10)
            $0.width.height.equalTo(20)
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
