//
//  CustomTextView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: nil)
        self.isScrollEnabled = false
        self.textContainerInset = UIEdgeInsets(top: 17, left: 15, bottom: 15, right: 15)
        self.font = .systemFont(ofSize: 15, weight: .semibold)
        
        self.backgroundColor = UIColor(named: "textViewBackgroundColor")
        self.layer.borderColor = UIColor(named: "textViewBorderColor")?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
        
        self.textContainer.maximumNumberOfLines = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
