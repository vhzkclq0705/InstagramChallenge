//
//  ChatViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    // MARK: - Property
    
    let chatView = ChatView()
    var chats = [Chat]()
    
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
    }

    // MARK: - Func
    
    func fetchChats() {
        API.searchingChats(pageIndex: 0, size: 30) { result in
            switch result {
            case .success(let chats):
                self.chats = chats.sorted(by: { $0.chatID < $1.chatID })
                
                DispatchQueue.main.async {
                    self.chatView.tableView.reloadData()
                }
            case .fail(let message):
                self.presentBasicAlert(message)
            }
        }
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
    
}
