//
//  UILable++Extensions.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/04.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(
            width: self.frame.size.width,
            height: CGFloat(Float.infinity))
        let charSize = self.font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height / charSize))
        
        return linesRoundedUp
    }
}
