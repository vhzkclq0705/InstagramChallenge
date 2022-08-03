//
//  ImageSlideCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class ImageSlideCell: UICollectionViewCell {
    
    static let identifier = "ImageSlideCell"
    
    // MARK: - UI
    
    let imageView = UIImageView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func addViews() {
        contentView.addSubview(imageView)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Func
    
    func updateCell() {
        
    }
    
}
