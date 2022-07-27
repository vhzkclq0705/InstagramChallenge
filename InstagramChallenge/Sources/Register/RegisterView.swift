//
//  RegisterView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class RegisterView: UIView {
    
    // MARK: - UI
    
    let topLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topLogo")
        
        return imageView
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "친구들의 사진과 동영상을 보려면 가입하세요."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "kakaoLogin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
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
        view.backgroundColor = UIColor(named: "grayBorderColor")
        
        return view
    }()
    
    let rightBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grayBorderColor")
        
        return view
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("휴대폰 번호 또는 이메일 주소로 가입", for: .normal)
        button.setTitleColor(UIColor(named: "enabledColor"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        
        return button
    }()
    
    let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grayBorderColor")
        
        return view
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
        button.setTitleColor(UIColor(named: "enabledColor"), for: .normal)
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
        setLayout()
    }
    
    // MARK: - Setup
    
    func addViews() {
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topLogoImageView,
            topLabel,
            kakaoLoginButton,
            orLabel,
            leftBorderView,
            rightBorderView,
            registerButton,
            bottomBorderView,
            bottomStackView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func setLayout() {
        topLogoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(70)
        }
        
        topLabel.snp.makeConstraints {
            $0.top.equalTo(topLogoImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.9)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        orLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(1.1)
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
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
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
