//
//  HomeView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class HomeView: BaseView {
    
    // MARK: - UI
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StoryCell.self, forCellReuseIdentifier: StoryCell.identifier)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        tableView.separatorColor = UIColor.customColor(.lightgray2)
        tableView.rowHeight = 80
        
        return tableView
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
        self.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
