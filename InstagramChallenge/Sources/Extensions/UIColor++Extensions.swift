//
//  UIColor++Extensions.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

enum Colors {
    case enabled
    case disabled
    case lightgray
    case lightgray2
    case deepBlue
}

extension UIColor {
    
    static func customColor(_ color: Colors) -> UIColor {
        switch color {
        case .enabled: return #colorLiteral(red: 0.2549019608, green: 0.5725490196, blue: 0.937254902, alpha: 1)
        case .disabled: return #colorLiteral(red: 0.5450980392, green: 0.7764705882, blue: 0.9568627451, alpha: 1)
        case .lightgray: return #colorLiteral(red: 0.9411765933, green: 0.9411766529, blue: 0.9411765337, alpha: 1)
        case .lightgray2: return #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        case .deepBlue: return #colorLiteral(red: 0.1501621604, green: 0.3250823617, blue: 0.5042748451, alpha: 1)
        }
    }
}
