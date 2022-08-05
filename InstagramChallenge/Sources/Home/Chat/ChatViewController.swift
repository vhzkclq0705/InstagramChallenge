//
//  ChatViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ChatViewController: UIViewController {

    // MARK: - Property
    
    let chatView = ChatView()
    var chats = [Chat]()
    let placeholder = "메시지 보내기..."
    var checkText = ""
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        fetchChats()
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() {
        
    }
    
    func configureViewController() {
        self.tabBarController?.tabBar.isHidden = true
        
        chatView.tableView.delegate = self
        chatView.tableView.dataSource = self
        chatView.textView.delegate = self
        
        chatView.sendButton.addTarget(
            self,
            action: #selector(didTapSendButton(_:)),
            for: .touchUpInside)
        
        chatView.textView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }

    // MARK: - Func
    
    func fetchChats() {
        API.searchingChats(pageIndex: 0, size: 30) { result in
            switch result {
            case .success(let chats):
                self.chats = chats.sorted(by: { $0.chatID < $1.chatID })
                
                DispatchQueue.main.async {
                    self.scrollToBottom()
                }
            case .fail(let message):
                self.presentBasicAlert(message)
            }
        }
    }
    
    func sendChats() {
        let parameter = ["content": checkText]
        
        API.sendChats(parameter) {
            self.fetchChats()
        }
    }
    
    func initTextViewState() {
        chatView.textView.text = placeholder
        chatView.textView.textColor = .lightGray
        chatView.textView.translatesAutoresizingMaskIntoConstraints = true
        chatView.textView.sizeToFit()
        chatView.textView.isScrollEnabled = false
        changeSendButtonState(false)
    }
    
    func changeSendButtonState(_ bool: Bool) {
        chatView.chatButtons.isHidden = bool
        chatView.sendButton.isHidden = !bool
    }
    
    func scrollToBottom()  {
        chatView.tableView.reloadData()
        
        if chats.count > 0 {
            let indexPath = IndexPath(row: chats.count - 1, section: 0)
            chatView.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    // MARK: - Action
    
    @objc func didTapSendButton(_ sender: Any) {
        sendChats()
        initTextViewState()
        scrollToBottom()
    }
    
}

// MARK: - TableView

extension ChatViewController: UITableViewDelegate,
                              UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int)
    -> Int
    {
        return chats.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatCell.identifier,
            for: indexPath) as? ChatCell else {
            return UITableViewCell()
        }
        
        let chat = chats[indexPath.row]
        cell.updateCell(chat)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
}

// MARK: - TextView

extension ChatViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        checkText = textView.text
        
        if textView.text.count > 0 {
            changeSendButtonState(true)
        }
        
        if textView.text.count > 200 {
            textView.deleteBackward()
        }
        
        textView.isScrollEnabled = textView.frame.height >= 132 ? true : false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = textView.text == placeholder ? "" : checkText
        textView.textColor = .black
        
        chatView.textView.snp.updateConstraints {
            $0.bottom.equalTo(200).offset(-10)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            initTextViewState()
        }
        
        chatView.textView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
}
