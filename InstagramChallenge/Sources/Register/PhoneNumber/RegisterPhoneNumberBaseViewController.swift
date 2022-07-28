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

class RegisterPhoneNumberBaseViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let registerPhoneNumberBaseView = RegisterPhoneNumberBaseView()
    lazy var phoneNumberVC: PhoneNumberViewController = {
        let vc = PhoneNumberViewController()
        vc.delegate = self
        
        return vc
    }()
    var dataSources = [(title: String, vc: UIViewController)]()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = registerPhoneNumberBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureNavigationController() {
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
    
    func configureViewController() {
        dataSources.append((title: "전화번호", vc: phoneNumberVC))
        dataSources.append((title: "이메일", vc: EmailViewController()))
        
        registerPhoneNumberBaseView.menuViewController.dataSource = self
        registerPhoneNumberBaseView.menuViewController.delegate = self
        registerPhoneNumberBaseView.contentViewcontroller.dataSource = self
        registerPhoneNumberBaseView.contentViewcontroller.delegate = self
        
        registerPhoneNumberBaseView.menuViewController.reloadData()
        registerPhoneNumberBaseView.contentViewcontroller.reloadData()
        
        registerPhoneNumberBaseView.loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapLoginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - PagingMenu

extension RegisterPhoneNumberBaseViewController: PagingMenuViewControllerDataSource,
                                                 PagingMenuViewControllerDelegate {
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        dataSources.count
    }
    
    func menuViewController(
        viewController: PagingMenuViewController,
        cellForItemAt index: Int)
    -> PagingMenuViewCell
    {
        guard let cell = viewController.dequeueReusableCell(
            withReuseIdentifier: MenuCell.id,
            for: index) as? MenuCell else {
            return PagingMenuViewCell()
        }
        
        cell.updateCell(dataSources[index].title)
        
        return cell
    }
    
    func menuViewController(
        viewController: PagingMenuViewController,
        widthForItemAt index: Int)
    -> CGFloat
    {
        let width = UIScreen.main.bounds.width
        
        return (width - 80) / 2
    }
    
    func menuViewController(
        viewController: PagingMenuViewController,
        didSelect page: Int,
        previousPage: Int)
    {
        registerPhoneNumberBaseView.contentViewcontroller.scroll(to: page, animated: true)
    }
}

// MARK: - PagingContent

extension RegisterPhoneNumberBaseViewController: PagingContentViewControllerDataSource,
                                                 PagingContentViewControllerDelegate {
    
    func numberOfItemsForContentViewController(
        viewController: PagingContentViewController)
    -> Int
    {
        return dataSources.count
    }
    
    func contentViewController(
        viewController: PagingContentViewController,
        viewControllerAt index: Int)
    -> UIViewController
    {
        return dataSources[index].vc
    }
    
    func contentViewController(
        viewController: PagingContentViewController,
        didManualScrollOn index: Int,
        percent: CGFloat)
    {
        registerPhoneNumberBaseView.menuViewController.scroll(index: index, animated: true)
    }
}

// MARK: - certificationDelegate

extension RegisterPhoneNumberBaseViewController: certificationDelegate {
    func pushCertificationViewController(_ phoneNumber: String) {
        let vc = CertificationViewController()
        vc.phoneNumber = phoneNumber
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
