//
//  PopupViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

protocol removeBlurDelegate {
    func removeBlur()
}

class PopupViewController: UIViewController {

    // MARK: - Property
    
    let popupView = PopupView()
    var delegate: removeBlurDelegate?
    let texts = [
        "보관",
        "좋아요 수 숨기기",
        "댓글 기능 목록",
        "수정",
        "내 프로필에 고정",
        "다른 앱에 게시..",
        "삭제",
    ]
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    // MARK: - Setup
    
    func configureViewController() {
        popupView.tableView.delegate = self
        popupView.tableView.dataSource = self
        
        popupView.backgroundTapGesture.addTarget(
            self,
            action: #selector(didTapBackgroundView(_:)))
    }

    // MARK: - Action
    
    @objc func didTapBackgroundView(_ sender: Any) {
        delegate?.removeBlur()
        self.dismiss(animated: true)
    }
}

// MARK: - TableView

extension PopupViewController: UITableViewDelegate,
                               UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int)
    -> Int
    {
        return texts.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ListCell.identifier,
            for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let text = texts[indexPath.row]
        cell.updateCell(text)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat
    {
        return tableView.frame.height / CGFloat(texts.count)
    }
    
}
