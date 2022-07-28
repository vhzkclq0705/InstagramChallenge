//
//  CustomButton.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "disabledColor")
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.layer.cornerRadius = 10
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    
    func configureTitle(_ text: String) {
        self.setTitle(text, for: .normal)
    }
    
    func changeState(_ bool: Bool) {
        self.isUserInteractionEnabled = bool
        self.backgroundColor = bool
        ? UIColor(named: "enabledColor")
        : UIColor(named: "disabledColor")

    }
}
