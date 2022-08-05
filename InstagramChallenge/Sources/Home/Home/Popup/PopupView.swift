//
//  PopupView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class PopupView: UIView {
    
    // MARK: - UI
    
    let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    let topBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9076007882, green: 0.9076007882, blue: 0.9076007882, alpha: 1)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let shareView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9076007882, green: 0.9076007882, blue: 0.9076007882, alpha: 1)
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    let shareLabel: UILabel = {
        let label = UILabel()
        label.text = "공유"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    let linkView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9076007882, green: 0.9076007882, blue: 0.9076007882, alpha: 1)
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    let linkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "link"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.text = "링크"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.9076007882, green: 0.9076007882, blue: 0.9076007882, alpha: 1)
        tableView.separatorInset = .zero
        tableView.layer.cornerRadius = 12
        tableView.isScrollEnabled = false
        tableView.clipsToBounds = true
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        
        return tableView
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let backgroundTapGesture = UITapGestureRecognizer()
    
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
        backgroundView.addGestureRecognizer(backgroundTapGesture)
        
        [shareButton, shareLabel]
            .forEach { shareView.addSubview($0) }
        
        [linkButton, linkLabel]
            .forEach { linkView.addSubview($0) }
        
        [
            topBar,
            shareView,
            linkView,
            tableView,
        ]
            .forEach { subView.addSubview($0) }
        
        [
            backgroundView,
            subView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        subView.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.centerY).offset(-100)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        topBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(3)
        }
        
        shareView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(topBar.snp.centerX).offset(-10)
            $0.height.equalTo(55)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        shareLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
        linkView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(30)
            $0.leading.equalTo(topBar.snp.centerX).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(55)
        }
        
        linkButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        linkLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(shareView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
        }
        
    }
    
}
