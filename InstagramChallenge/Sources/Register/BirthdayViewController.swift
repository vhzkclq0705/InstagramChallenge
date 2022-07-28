//
//  BirthdayViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/29.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import UIKit

import SnapKit

class BirthdayViewController: HideBackButtonViewController {

    // MARK: - Property
    
    let birthdayView = BirthdayView()
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        datePicker.addTarget(
            self,
            action: #selector(didChangeDatePicker(_:)),
            for: .valueChanged)
        
        return datePicker
    }()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = birthdayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Keyboard
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birthdayView.endEditing(true)
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        birthdayView.birthdayTextField.delegate = self
        birthdayView.birthdayTextField.placeholder = formatDate(Date())
        birthdayView.birthdayTextField.inputView = datePicker
        birthdayView.birthdayTextField.inputView?.backgroundColor = UIColor(named: "textViewBackgroundColor")
        
        birthdayView.birthdayTextField.addTarget(
            self,
            action: #selector(didChangeTextField(_:)),
            for: .touchUpInside)
        birthdayView.nextButton.addTarget(
            self,
            action: #selector(didTapNextButton(_:)),
            for: .touchUpInside)
        
        birthdayView.nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    // MARK: - Func
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        
        return formatter.string(from: date)
    }
    
    func updateNextButtonConstraint(_ bool: Bool) {
        let width = datePicker.frame.height
        
        birthdayView.nextButton.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(bool ? -width : 0)
        }
    }
    
    // MARK: - Action
    
    @objc func didChangeDatePicker(_ datePicker: UIDatePicker) {
        birthdayView.birthdayTextField.text = formatDate(datePicker.date)
    }
    
    @objc func didChangeTextField(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        birthdayView.nextButton.changeState(!text.isEmpty)
    }

    @objc func didTapNextButton(_ sender: Any) {
        
    }
}

// MARK: - TextField

extension BirthdayViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateNextButtonConstraint(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateNextButtonConstraint(false)
    }
}
