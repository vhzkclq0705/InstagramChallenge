//
//  MenuCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/28.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit
import PagingKit

class MenuCell: PagingMenuViewCell {
    
    static let id = "MenuCell"
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let bottomBorderView = GrayBorderView()
    
    override public var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .black : .lightGray
            bottomBorderView.backgroundColor = isSelected ? .black : .lightGray
        }
    }
    
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
        [titleLabel, bottomBorderView].forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
    // MARK: - Funcs
    
    func updateCell(_ text: String) {
        self.titleLabel.text = text
    }
}
