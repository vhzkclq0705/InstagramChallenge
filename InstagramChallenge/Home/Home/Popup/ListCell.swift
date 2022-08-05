//
//  ListCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ListCell: UITableViewCell {
    
    static let identifier = "ListCell"
    
    // MARK: - UI
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9076007882, green: 0.9076007882, blue: 0.9076007882, alpha: 1)
        
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    
    func updateCell(_ text: String) {
        label.text = text
        
        if text == "삭제" {
            label.textColor = .red
        }
    }
}
