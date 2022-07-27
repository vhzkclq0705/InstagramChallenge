//
//  CustomTextField.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.borderStyle = .none
        self.font = .systemFont(ofSize: 15, weight: .medium)
        
        self.backgroundColor = UIColor(named: "textViewBackgroundColor")
        self.layer.borderColor = UIColor(named: "grayBorderColor")?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
