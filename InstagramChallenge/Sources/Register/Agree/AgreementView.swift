//
//  AgreementView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class AgreementView: BaseView {
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "약관 동의"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram은 회원님의 개인 정보를 안전하게\n보호합니다. 새 계정을 만들려면 모든 약관에\n동의하세요."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 3
        
        return label
    }()
    
    lazy var allAgreeLabel = createAgreeLabel("모두 동의")
    
    lazy var allAgreeRadioButton = createRadioButton()
    
    let midBorderView = GrayBorderView()
    
    lazy var firstAgreeLabel = createAgreeLabel("이용 약관(필수)")
    
    lazy var firstMoreButton = createMoreButton()
    
    lazy var firstRadioButton = createRadioButton()
    
    lazy var secondAgreeLabel = createAgreeLabel("데이터 정책(필수)")
    
    lazy var secondMoreButton = createMoreButton()
    
    lazy var secondRadioButton = createRadioButton()
    
    lazy var thirdAgreeLabel = createAgreeLabel("위치 기반 기능(필수)")
    
    lazy var thirdMoreButton = createMoreButton()
    
    lazy var thirdRadioButton = createRadioButton()
    
    let bottomBorderView = GrayBorderView()
    
    let nextButton: CustomButton = {
        let button = CustomButton()
        button.configureTitle("계속")
        
        return button
    }()
    
    // MARK: - Property
    
    var moreButtons = [UIButton]()
    var radioButtons = [UIButton]()
    
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
            firstMoreButton,
            secondMoreButton,
            thirdMoreButton,
        ]
            .forEach { moreButtons.append($0) }
        
        [
            firstRadioButton,
            secondRadioButton,
            thirdRadioButton,
        ]
            .forEach { radioButtons.append($0) }
        
        [
            titleLabel,
            guideLabel,
            allAgreeLabel,
            allAgreeRadioButton,
            midBorderView,
            firstAgreeLabel,
            firstMoreButton,
            firstRadioButton,
            secondAgreeLabel,
            secondMoreButton,
            secondRadioButton,
            thirdAgreeLabel,
            thirdMoreButton,
            thirdRadioButton,
            bottomBorderView,
            nextButton
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        allAgreeLabel.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        allAgreeRadioButton.snp.makeConstraints {
            $0.centerY.equalTo(allAgreeLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(30)
        }
        
        midBorderView.snp.makeConstraints {
            $0.top.equalTo(allAgreeLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        firstAgreeLabel.snp.makeConstraints {
            $0.top.equalTo(midBorderView.snp.bottom).offset(15)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        firstMoreButton.snp.makeConstraints {
            $0.top.equalTo(firstAgreeLabel.snp.bottom)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        firstRadioButton.snp.makeConstraints {
            $0.centerY.equalTo(firstAgreeLabel)
            $0.trailing.equalTo(allAgreeRadioButton)
            $0.width.height.equalTo(30)
        }
        
        secondAgreeLabel.snp.makeConstraints {
            $0.top.equalTo(firstMoreButton.snp.bottom).offset(25)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        secondMoreButton.snp.makeConstraints {
            $0.top.equalTo(secondAgreeLabel.snp.bottom)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        secondRadioButton.snp.makeConstraints {
            $0.centerY.equalTo(secondAgreeLabel)
            $0.trailing.equalTo(allAgreeRadioButton)
            $0.width.height.equalTo(30)
        }
        
        thirdAgreeLabel.snp.makeConstraints {
            $0.top.equalTo(secondMoreButton.snp.bottom).offset(25)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        thirdMoreButton.snp.makeConstraints {
            $0.top.equalTo(thirdAgreeLabel.snp.bottom)
            $0.leading.equalTo(allAgreeLabel)
        }
        
        thirdRadioButton.snp.makeConstraints {
            $0.centerY.equalTo(thirdAgreeLabel)
            $0.trailing.equalTo(allAgreeRadioButton)
            $0.width.height.equalTo(30)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Func
    
    func createAgreeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }
    
    func createMoreButton() -> UIButton {
        let button = UIButton()
        button.setTitle("더 알아보기", for: .normal)
        button.setTitleColor(UIColor.customColor(.deepBlue), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        
        return button
    }
    
    func createRadioButton() -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(systemName: "circle")?
                .withTintColor(.lightGray, renderingMode: .alwaysOriginal),
            for: .normal)
        button.setImage(
            UIImage(systemName: "checkmark")?
                .withTintColor(.green, renderingMode: .alwaysOriginal),
            for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }
}
