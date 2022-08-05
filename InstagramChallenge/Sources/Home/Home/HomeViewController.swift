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
    var isPaging = false
    var currentPage = 0
    
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
        self.navigationController?.navigationBar.barTintColor = .white
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
        messageButton.addTarget(
            self,
            action: #selector(didTapMessageButton(_:)),
            for: .touchUpInside)
    }
    
    func configureViewController() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.refreshControl = UIRefreshControl()
        homeView.tableView.refreshControl?.addTarget(
            self,
            action: #selector(didPullTableView(_:)),
            for: .valueChanged)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reloadTableView),
            name: NSNotification.Name("reload"),
            object: nil)
    }
    
    // MARK: - Func
    
    func createCustomButton(_ name: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(named: name), for: .normal)
        
        return button
    }
    
    func fetchFeeds() {
        API.searchingFeed(pageIndex: currentPage, size: 10) { result in
            
            DispatchQueue.main.async {
                self.homeView.tableView.refreshControl?.endRefreshing()
            }
            
            switch result {
            case .success(let feeds):
                if feeds.count == 0 {
                    self.currentPage = 0
                } else {
                    if self.isPaging {
                        self.feeds += feeds
                    } else {
                        self.feeds = feeds
                    }
                }
                
                DispatchQueue.main.async {
                    self.homeView.tableView.reloadData()
                }
            case .fail(let message):
                print(message)
            }
            
            self.isPaging = false
        }
    }
    
    func paging() {
        isPaging = true
        currentPage += 1
        fetchFeeds()
    }
    
    // MARK: - Action
    
    @objc func didPullTableView(_ refreshControl: UIRefreshControl) {
        print("테이블뷰 새로고침")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fetchFeeds()
        }
    }
    
    @objc func didTapAddButton(_ sender: Any) {
        let vc = SelectPhotoViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapMessageButton(_ sender: Any) {
        
    }
    
    @objc func reloadTableView() {
        homeView.alpha = 1
        self.navigationController?.navigationBar.alpha = 1
        fetchFeeds()
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
            
            cell.ellipsisButtonTapHandler = {
                if feed.loginID == TokenManager.shared.loginID {
                    let vc = PopupViewController()
                    vc.modalPresentationStyle = .overFullScreen
                    vc.id = feed.id
                    
                    self.present(vc, animated: true)
                    self.homeView.alpha = 0.4
                    self.navigationController?.navigationBar.alpha = 0.4
                }
            }
            
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath)
    {
        guard let lastIndex = tableView.indexPathsForVisibleRows?.last?.row else {
            return
        }
        
        if lastIndex == feeds.count - 2 && !isPaging {
            paging()
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
