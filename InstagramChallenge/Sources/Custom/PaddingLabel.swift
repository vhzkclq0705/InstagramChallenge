//
//  PaddingLabel.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/04.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    
    // MARK: - Property
    
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
 
    // MARK: - Init
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
    
}
