//
//  SelectPhotoView.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class SelectPhotoView: UIView {
    
    // MARK: - UI
    
    let mainImageView = UIImageView()
    
    let extensionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "extension"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.11485012, green: 0.1243507347, blue: 0.1381527679, alpha: 1)
        button.layer.cornerRadius = 12.5
        
        return button
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.11485012, green: 0.1243507347, blue: 0.1381527679, alpha: 1)
        
        return view
    }()
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 항목"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 6) / 4
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.backgroundColor = .black
        
        return collectionView
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
        [photoLabel, arrowButton]
            .forEach { headerView.addSubview($0) }
        
        [
            mainImageView,
            extensionButton,
            headerView,
            collectionView,
        ]
            .forEach { self.addSubview($0) }
    }
    
    func configureLayout() {
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(mainImageView.snp.width).multipliedBy(1.1)
        }
        
        extensionButton.snp.makeConstraints {
            $0.bottom.equalTo(mainImageView).offset(-10)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(25)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        photoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
        }
        
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(photoLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
