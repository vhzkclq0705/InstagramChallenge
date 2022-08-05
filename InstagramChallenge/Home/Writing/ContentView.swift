//
//  ContentView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ContentView: BaseView {
    
    // MARK: - UI
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "문구 입력.."
        textView.textColor = .lightGray
        textView.font = .systemFont(ofSize: 17, weight: .medium)
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    lazy var tagStackView = createStackView()
    lazy var tagLabel = createLabel("사람 태그하기")
    lazy var tagArrowButton = createArrowButton()
    
    lazy var locationStackView = createStackView()
    lazy var locationLabel = createLabel("위치 추가")
    lazy var locationArrowButton = createArrowButton()
    
    lazy var facebookStackView = createStackView()
    lazy var facebookLabel = createLabel("Facebook")
    let facebookSwitch = UISwitch()
    
    lazy var twitterStackView = createStackView()
    lazy var twitterLabel = createLabel("Twitter")
    let twitterSwitch = UISwitch()
    
    lazy var tumblrStackView = createStackView()
    lazy var tumblrLabel = createLabel("Tumblr")
    let tumblrSwitch = UISwitch()
    
    lazy var settingsStackView = createStackView()
    lazy var settingsLabel = createLabel("고급 설정")
    lazy var settingsArrowButton = createArrowButton()
    
    let border1 = GrayBorderView()
    let border2 = GrayBorderView()
    let border3 = GrayBorderView()
    let border4 = GrayBorderView()
    let border5 = GrayBorderView()
    let border6 = GrayBorderView()
    
    let maskingView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.isHidden = true
        
        return view
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
        [tagLabel, tagArrowButton]
            .forEach { tagStackView.addArrangedSubview($0) }
        
        [locationLabel, locationArrowButton]
            .forEach { locationStackView.addArrangedSubview($0) }
        
        [facebookLabel, facebookSwitch]
            .forEach { facebookStackView.addArrangedSubview($0) }
        
        [twitterLabel, twitterSwitch]
            .forEach { twitterStackView.addArrangedSubview($0) }
        
        [tumblrLabel, tumblrSwitch]
            .forEach { tumblrStackView.addArrangedSubview($0) }
        
        [settingsLabel, settingsArrowButton]
            .forEach { settingsStackView.addArrangedSubview($0) }
        
        [
            border1,
            imageView,
            textView,
            border2,
            tagStackView,
            border3,
            locationStackView,
            border4,
            facebookStackView,
            twitterStackView,
            tumblrStackView,
            border5,
            settingsStackView,
            border6,
            maskingView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        border1.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(border1.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(80)
        }
        
        textView.snp.makeConstraints {
            $0.centerY.equalTo(imageView)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(80)
        }
        
        border2.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        tagStackView.snp.makeConstraints {
            $0.top.equalTo(border2.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        border3.snp.makeConstraints {
            $0.top.equalTo(tagStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        locationStackView.snp.makeConstraints {
            $0.top.equalTo(border3.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        border4.snp.makeConstraints {
            $0.top.equalTo(locationStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        facebookStackView.snp.makeConstraints {
            $0.top.equalTo(border4.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        twitterStackView.snp.makeConstraints {
            $0.top.equalTo(facebookStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        tumblrStackView.snp.makeConstraints {
            $0.top.equalTo(twitterStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        border5.snp.makeConstraints {
            $0.top.equalTo(tumblrStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        settingsStackView.snp.makeConstraints {
            $0.top.equalTo(border5.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        border6.snp.makeConstraints {
            $0.top.equalTo(settingsStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        maskingView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(border2)
            $0.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Func
    
    func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .medium)
        
        return label
    }
    
    func createArrowButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        
        return button
    }
    
    func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        return stackView
    }
    
}
