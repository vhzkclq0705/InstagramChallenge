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
    
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() {
        let logo = UIImageView(image: UIImage(named: "smallLogo"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logo)
        
        self.navigationItem.rightBarButtonItems = [
            createCustomBarButton("send"),
            createSpacing(25),
            createCustomBarButton("bell"),
            createSpacing(25),
            createCustomBarButton("plus"),
        ]
    }
    
    func configureViewController() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
    
    // MARK: - Func

    func createCustomBarButton(_ name: String) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(named: name), for: .normal)
        
        return UIBarButtonItem(customView: button)
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
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StoryCell.identifier,
            for: indexPath) as? StoryCell else {
            return UITableViewCell()
        }
        
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
