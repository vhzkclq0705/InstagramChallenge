//
//  PopupViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/06.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    // MARK: - Property
    
    let popupView = PopupView()
    var id: Int!
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
    
    // MARK: - Func
    
    func presentActionSheet() {
        self.popupView.subView.isHidden = true
        let title = "이 게시물을 삭제하지않으려면 게시굴을 보관할 수 있습니다. 보관한 게시물은 회원님만 볼 수 있습니다."
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            API.deleteFeed(self.id) { isSuccess in
                self.dismissViewController()
                if !isSuccess {
                    print("삭제 실패")
                }
            }
        }
        let saveAction = UIAlertAction(title: "보관", style: .default) { _ in
            self.dismissViewController()
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.dismissViewController()
        }
        
        [
            deleteAction,
            saveAction,
            cancleAction
        ]
            .forEach { alert.addAction($0) }
        
        self.present(alert, animated: true)
    }
    
    func dismissViewController() {
        callReloadNotification()
        self.dismiss(animated: true)
    }

    // MARK: - Action
    
    @objc func didTapBackgroundView(_ sender: Any) {
        dismissViewController()
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
        didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3 {
            
        }
        
        if indexPath.row == 6 {
            presentActionSheet()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat
    {
        return tableView.frame.height / CGFloat(texts.count)
    }
    
}
