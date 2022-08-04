//
//  String++Extensions.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/04.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import Foundation

extension String {
    
    func caculateDiff() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = formatter.date(from: self)!
        let now = Date().addingTimeInterval(9 * 3600)
        let min: Int = Int(now.timeIntervalSince(date)) / 60
        let hour = min / 60
        let day = hour / 24
        
        if min < 60 {
            return "\(min)분 전"
        }
        if hour < 24 {
            return "\(hour)시간 전"
        }
        if day < 30 {
            return "\(day)일 전"
        }
        
        formatter.dateFormat = "MM월 dd일"
        let monthDay = formatter.string(from: date)
        
        return monthDay
    }
    
}
