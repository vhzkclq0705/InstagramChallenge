//
//  ChatCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ChatCell: UITableViewCell {
    
    static let identifier = "ChatCell"
    
    // MARK: - UI
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.isHidden = true
        
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.isHidden = true
        
        return label
    }()
    
    let chatLabel: PaddingLabel = {
        let label = PaddingLabel(
            padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    // MARK: - Life cycle
    
    override func prepareForReuse() {
        profileImageView.isHidden = true
        chatLabel.snp.removeConstraints()
    }
    
    // MARK: - Func
    
    func updateCell(_ chat: Chat) {
        chatLabel.text = chat.content
        
        if chat.loginID == TokenManager.shared.loginID {
            showMyChat()
        } else {
            showOthersChat()
        }
    }
    
    func showTimeLabel() {
        contentView.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
    }
    
    func showOthersChat() {
        profileImageView.isHidden = false
        chatLabel.backgroundColor = .white
        
        [profileImageView, chatLabel]
            .forEach { contentView.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(40)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
    }
    
    func showMyChat() {
        chatLabel.backgroundColor = .systemGray4
        chatLabel.textAlignment = .right
        contentView.addSubview(chatLabel)
        
        chatLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.greaterThanOrEqualToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    
}
