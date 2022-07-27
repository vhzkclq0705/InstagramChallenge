//
//  RegisterPhoneNumberBaseViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit
import PagingKit

class RegisterPhoneNumberBaseViewController: UIViewController {

    // MARK: - UI
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호 또는 이메일 주소 입력"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var menuViewController: PagingMenuViewController = {
        let vc = PagingMenuViewController()
        vc.dataSource = self
        vc.delegate = self
        vc.cellAlignment = .center
        vc.register(type: MenuCell.self, forCellWithReuseIdentifier: "MenuCell")
        
        return vc
    }()
    
    lazy var contentViewcontroller: PagingContentViewController = {
        let vc = PagingContentViewController()
        vc.dataSource = self
        vc.delegate = self
        
        return vc
    }()
    
    let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grayBorderColor")
        
        return view
    }()
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "이미 계정이 있으신가요?"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor(named: "enabledColor"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return button
    }()

    // MARK: - Property
    
    let dataSources: [(String, UIViewController)] = [
        ("전화번호", PhoneNumberViewController()),
        ("이메일", EmailViewController()),
    ]
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setViewController()
        setLayout()
    }
    
    // MARK: - Setup
    
    func setNavigationController() {
        self.navigationItem.hidesBackButton = true
        let config = UIImage.SymbolConfiguration(
            pointSize: 18,
            weight: .semibold)
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left", withConfiguration: config)?
                .withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(didTapBackButton(_:)))
        
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setViewController() {
        view.backgroundColor = .white
        
        [questionLabel, loginButton]
            .forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            topLabel,
            menuViewController.view,
            contentViewcontroller.view,
            bottomBorderView,
            bottomStackView,
        ]
            .forEach { self.view.addSubview($0) }
        
        menuViewController.reloadData()
        contentViewcontroller.reloadData()
    }
    
    func setLayout() {
        topLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        menuViewController.view.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        contentViewcontroller.view.snp.makeConstraints {
            $0.top.equalTo(menuViewController.view.snp.bottom)
            $0.bottom.equalTo(bottomBorderView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.bottom.equalTo(bottomStackView.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - PagingMenu

extension RegisterPhoneNumberBaseViewController: PagingMenuViewControllerDataSource,
                                                 PagingMenuViewControllerDelegate {
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        dataSources.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        guard let cell = viewController.dequeueReusableCell(
            withReuseIdentifier: "MenuCell",
            for: index) as? MenuCell else {
            return PagingMenuViewCell()
        }
        
        cell.updateCell(dataSources[index].0)
        
        return cell
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return (self.view.frame.width - 80) / 2
    }
    
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewcontroller.scroll(to: page, animated: true)
    }
}

// MARK: - PagingContent

extension RegisterPhoneNumberBaseViewController: PagingContentViewControllerDataSource,
                                                 PagingContentViewControllerDelegate {
    
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSources.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSources[index].1
    }
    
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, animated: true)
    }
}
