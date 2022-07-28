//
//  RegisterPhoneNumberBaseView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit
import PagingKit

class RegisterPhoneNumberBaseView: UIView {
    
    // MARK: - UI
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호 또는 이메일 주소 입력"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    let menuViewController: PagingMenuViewController = {
        let vc = PagingMenuViewController()
        vc.cellAlignment = .center
        vc.register(type: MenuCell.self, forCellWithReuseIdentifier: MenuCell.id)
        
        return vc
    }()
    
    let contentViewcontroller = PagingContentViewController()
    
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
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topLabel,
            menuViewController.view,
            contentViewcontroller.view,
            bottomBorderView,
            bottomStackView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        topLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        menuViewController.view.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        contentViewcontroller.view.snp.makeConstraints {
            $0.top.equalTo(menuViewController.view.snp.bottom)
            $0.bottom.equalTo(bottomBorderView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(40)
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
