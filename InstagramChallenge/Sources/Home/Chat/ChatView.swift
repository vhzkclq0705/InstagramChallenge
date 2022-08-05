//
//  ChatView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ChatView: BaseView {
    
    // MARK: - UI
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.identifier)
        
        return tableView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 25
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 50, bottom: 15, right: 100)
        textView.text = "메시지 보내기..."
        textView.textColor = .lightGray
        textView.font = .systemFont(ofSize: 17)
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "camera"), for: .normal)
        
        return button
    }()
    
    let chatButtons: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "chat.buttons"), for: .normal)
        
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("보내기", for: .normal)
        button.setTitleColor(UIColor.customColor(.enabled), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.isHidden = true
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        [tableView, textView, cameraButton, chatButtons, sendButton,]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalTo(textView.snp.top)
        }
        
        textView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(50)
        }
        
        cameraButton.snp.makeConstraints {
            $0.bottom.equalTo(textView).offset(-5)
            $0.leading.equalTo(textView).offset(5)
            $0.width.height.equalTo(40)
        }
        
        chatButtons.snp.makeConstraints {
            $0.bottom.equalTo(textView).offset(-5)
            $0.trailing.equalTo(textView).offset(-10)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
    }
    
}
