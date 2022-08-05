//
//  ContentViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    // MARK: - Property
    
    let contentView = ContentView()
    var image: UIImage!
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.title = "새 게시물"
        
        lazy var backButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.tintColor = .black
            button.addTarget(
                self,
                action: #selector(didTapBackButton(_:)),
                for: .touchUpInside)
            
            return button
        }()
        
        lazy var shareButton: UIButton = {
            let button = UIButton()
            button.setTitle("공유", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(
                self,
                action: #selector(didTapShareButton(_:)),
                for: .touchUpInside)
            
            return button
        }()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
    }
    
    func configureViewController() {
        contentView.imageView.image = image
        
        contentView.textView.delegate = self
    }
    
    // MARK: - Func
    
    
    // MARK: - Action
    
    @objc func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapShareButton(_ sender: Any) {
        
    }

}

// MARK: - TextView

extension ContentViewController: UITextViewDelegate {
    
}
