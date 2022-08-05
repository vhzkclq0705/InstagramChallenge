//
//  ContentViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import FirebaseStorage

class ContentViewController: UIViewController {

    // MARK: - Property
    
    let contentView = ContentView()
    var image: UIImage!
    let firebaseStorage = Storage.storage()
    var backButton: UIBarButtonItem?
    var shareButton: UIBarButtonItem?
    let placeholder = "문구 입력.."
    var checkText = ""
    
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
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
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
        self.backButton = UIBarButtonItem(customView: backButton)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
        self.shareButton = UIBarButtonItem(customView: shareButton)
    }
    
    func configureViewController() {
        contentView.imageView.image = image
        
        contentView.textView.delegate = self
    }
    
    // MARK: - Func
    
    func uploadImage(completion: @escaping (String) -> Void) {
        let id = TokenManager.shared.loginID
        let millisec = Int(Date().timeIntervalSince1970 / 1000.0)
        let filePath = "jun/\(id)/jun_\(millisec)"
        let metaData = StorageMetadata()
        let firebaseReference = firebaseStorage.reference().child(filePath)
        
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }
        metaData.contentType = "image.jpg"
        firebaseReference.putData(data, metadata: metaData) { metaData, error in
            if let error = error {
                print(error.localizedDescription)
                self.presentBasicAlert("업로드에 실패하였습니다.")
            } else {
                firebaseReference.downloadURL { url, _ in
                    guard let url = url else { return }
                    completion("\(url)")
                }
            }
        }
    }
    
    func createFeed() {
        uploadImage() { url in
            let parameter: [String: Any] = [
                "feedText": self.checkText,
                "contentsUrls": [url]
            ]

            API.createFeed(parameter) { isSuccess in
                if isSuccess {
                    self.tabBarController?.tabBar.isHidden = false
                    self.callReloadNotification()
                    
                    let viewControllers = self.navigationController!
                        .viewControllers as [UIViewController]
                    
                    self.navigationController!.popToViewController(
                        viewControllers[viewControllers.count - 3],
                        animated: true)
                    
                    
                } else {
                    self.presentBasicAlert("업로드에 실패하였습니다.")
                }
            }
        }
        
    }
    
    func changeNavigationBar(_ bool: Bool) {
        contentView.maskingView.isHidden = !bool
        
        if bool {
            self.title = "문구"
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = nil
            
            lazy var completeButton: UIButton = {
                let button = UIButton()
                button.setTitle("확인", for: .normal)
                button.setTitleColor(.systemBlue, for: .normal)
                button.addTarget(
                    self,
                    action: #selector(didTapCompleteButton(_:)),
                    for: .touchUpInside)
                
                return button
            }()
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: completeButton)
        } else {
            self.title = "새 게시물"
            self.navigationItem.leftBarButtonItem = backButton
            self.navigationItem.rightBarButtonItem = shareButton
        }
    }
    
    // MARK: - Action
    
    @objc func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapShareButton(_ sender: Any) {
        createFeed()
    }

    @objc func didTapCompleteButton(_ sender: Any) {
        contentView.endEditing(true)
    }
}

// MARK: - TextView

extension ContentViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        checkText = textView.text
        
        if textView.text.count > 1000 {
            textView.deleteBackward()
        }
        
        textView.isScrollEnabled = textView.frame.height >= 80 ? true : false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        changeNavigationBar(true)
        
        textView.text = textView.text == placeholder ? "" : checkText
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        changeNavigationBar(false)
        
        if textView.text == "" {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
}
