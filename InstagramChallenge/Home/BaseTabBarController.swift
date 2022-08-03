//
//  BaseTabBarController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - UI
    
    let homeTab: UITabBarItem = UITabBarItem(
        title: nil,
        image: UIImage(named: "home"),
        selectedImage: UIImage(named: "home.fill")
    )
    
    let searchTab: UITabBarItem = UITabBarItem(
        title: nil,
        image: UIImage(named: "search"),
        selectedImage: UIImage(named: "search")
    )
    
    let reelsTab: UITabBarItem = UITabBarItem(
        title: nil,
        image: UIImage(named: "reels"),
        selectedImage: UIImage(named: "reels")
    )
    
    let shopTab: UITabBarItem = UITabBarItem(
        title: nil,
        image: UIImage(named: "shop"),
        selectedImage: UIImage(named: "shop")
    )
    
    let myPageTab: UITabBarItem = UITabBarItem(
        title: nil,
        image: UIImage(named: "mypage"),
        selectedImage: UIImage(named: "mypage.fill")
    )
    
    // MARK: - Property
    
    let homeVC = HomeViewController()
    let searchVC = SearchViewController()
    let reelsVC = ReelsViewController()
    let shopVC = ShopViewController()
    let myPageVC = MyPageViewController()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Setup
    
    func configureTabBar() {
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = .clear
        
        viewControllers = [
            homeVC,
            searchVC,
            reelsVC,
            shopVC,
            myPageVC,
        ]
        
        homeVC.tabBarItem = homeTab
        searchVC.tabBarItem = searchTab
        reelsVC.tabBarItem = reelsTab
        shopVC.tabBarItem = shopTab
        myPageVC.tabBarItem = myPageTab
    }
    
}
