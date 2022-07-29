//
//  BirthdayView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class BirthdayView: BaseView {
    
    // MARK: - UI
    
    let birthdayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "birthday")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "생일 추가"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "공개 프로필에 포함되지 않습니다."
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "왜 생일을 입력해야 하나요?"
        label.textColor = UIColor.customColor(.deepBlue)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        
        return label
    }()
    
    let birthdayTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.customColor(.enabled).cgColor
        
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "비즈니스나 반려동물 등을 위한 계정인 경우에도 회원님의\n생일을 사용하세요."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let bottomBorderView = GrayBorderView()
    
    let nextButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("다음")
        
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
            birthdayImageView,
            titleLabel,
            guideLabel,
            questionLabel,
            birthdayTextField,
            ageLabel,
            bottomLabel,
            bottomBorderView,
            nextButton,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        birthdayImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(birthdayImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        birthdayTextField.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        ageLabel.snp.makeConstraints {
            $0.centerY.equalTo(birthdayTextField)
            $0.trailing.equalTo(birthdayTextField).offset(-10)
        }
        
        bottomLabel.snp.makeConstraints {
            $0.bottom.equalTo(bottomBorderView.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
