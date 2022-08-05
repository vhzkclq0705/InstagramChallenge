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
        label.layer.cornerRadius = label.bounds.width / 2
        label.numberOfLines = 0
        
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
        [profileImageView, chatLabel]
            .forEach { contentView.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(20)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().offset(50)
        }
    }
    
    func showMyChat() {
        contentView.addSubview(chatLabel)
        
        chatLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().offset(20)
        }
    }
    
    
}
