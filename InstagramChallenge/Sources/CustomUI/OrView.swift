//
//  OrView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class OrView: UIView {
    
    // MARK: - UI
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    let leftBorderView = GrayBorderView()
    
    let rightBorderView = GrayBorderView()
    
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
            orLabel,
            leftBorderView,
            rightBorderView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        orLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        leftBorderView.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(orLabel.snp.leading).offset(-20)
            $0.height.equalTo(1)
        }
        
        rightBorderView.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalTo(orLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
