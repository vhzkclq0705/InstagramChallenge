//
//  StoryCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class StoryCell: UITableViewCell {
    
    static let identifier = "StoryCell"
    
    // MARK: - UI
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.story")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "내 스토리"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    let bottomBorderView = GrayBorderView()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func addViews() {
        [
            profileImageView,
            nameLabel,
            bottomBorderView,
        ]
            .forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom)
            $0.leading.trailing.equalTo(profileImageView)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}
