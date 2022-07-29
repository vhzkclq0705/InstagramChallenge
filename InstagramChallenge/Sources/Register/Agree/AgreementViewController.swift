//
//  AgreementViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

class AgreementViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let agreementView = AgreementView()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = agreementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup

    func configureViewController() {
        agreementView.allAgreeRadioButton.addTarget(
            self,
            action: #selector(didTapAllAgreeRadioButton(_:)),
            for: .touchUpInside)
        agreementView.moreButtons.forEach {
            $0.addTarget(self, action: #selector(didTapMoreButton(_:)), for: .touchUpInside)
        }
        agreementView.radioButtons.forEach {
            $0.addTarget(self, action: #selector(didTapRadioButton(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Func
    
    func checkAllRadioButtonsAreSelected() -> Bool {
        var checkCount: Int = 0
        agreementView.radioButtons.forEach {
            if $0.isSelected {
                checkCount += 1
            }
        }
        
        if checkCount == 3 {
            agreementView.nextButton.changeState(true)
            return true
        } else {
            agreementView.nextButton.changeState(false)
            return false
        }
    }
    
    
    // MARK: - Action
    
    @objc func didTapMoreButton(_ sender: Any) {
        guard let url = URL(string: "https://gridgetest.oopy.io") else { return }
        
        UIApplication.shared.open(url)
    }
    
    @objc func didTapRadioButton(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        agreementView.allAgreeRadioButton.isSelected = checkAllRadioButtonsAreSelected()
    }
    
    @objc func didTapAllAgreeRadioButton(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        agreementView.radioButtons.forEach {
            $0.isSelected = button.isSelected
        }
        
        agreementView.nextButton.changeState(button.isSelected)
    }
    
}
