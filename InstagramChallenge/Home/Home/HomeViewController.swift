//
//  HomeViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/30.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Property
    
    let homeView = HomeView()
    var feeds = [Feed]()
    
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        fetchFeeds()
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() {
        let logo = UIImageView(image: UIImage(named: "smallLogo"))
        let addButton = createCustomButton("plus")
        let bellButton = createCustomButton("bell")
        let messageButton = createCustomButton("send")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logo)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: messageButton),
            createSpacing(25),
            UIBarButtonItem(customView: bellButton),
            createSpacing(25),
            UIBarButtonItem(customView: addButton),
        ]
        
        addButton.addTarget(
            self,
            action: #selector(didTapAddButton(_:)),
            for: .touchUpInside)
        bellButton.addTarget(
            self,
            action: #selector(didTapBellButton(_:)),
            for: .touchUpInside)
        messageButton.addTarget(
            self,
            action: #selector(didTapMessageButton(_:)),
            for: .touchUpInside)
    }
    
    func configureViewController() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
    
    // MARK: - Func
    
    func fetchFeeds() {
        API.searchingFeed(pageIndex: 0, size: 100) { result in
            switch result {
            case .success(let feeds):
                self.feeds = feeds
                DispatchQueue.main.async {
                    self.homeView.tableView.reloadData()
                }
            case .fail(let message):
                print(message)
            }
        }
    }

    func createCustomButton(_ name: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(named: name), for: .normal)
        
        return button
    }
    
    // MARK: - Action
    
    @objc func didTapAddButton(_ sender: Any) {
        
    }
    
    @objc func didTapMessageButton(_ sender: Any) {
        
    }
    
    @objc func didTapBellButton(_ sender: Any) {
        
    }
    
}

// MARK: - TableView

extension HomeViewController: UITableViewDelegate,
                              UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int)
    -> Int
    {
        return feeds.count + 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
    {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoryCell.identifier,
                for: indexPath) as? StoryCell else {
                return UITableViewCell()
            }
            
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FeedCell.identifier,
                for: indexPath) as? FeedCell else {
                return UITableViewCell()
            }
            
            let feed = feeds[indexPath.row - 1]
            cell.updateCell(feed)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    
}
