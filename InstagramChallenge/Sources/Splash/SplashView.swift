//
//  SplashView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class SplashView: UIView {
    
    // MARK: - UI
    
    let centerLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    let bottomLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottomLogo")
        
        return imageView
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
        [centerLogoImageView, bottomLogoImageView].forEach { self.addSubview($0) }
    }
    
    func setLayout() {
        centerLogoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        bottomLogoImageView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(100)
        }
    }
}
