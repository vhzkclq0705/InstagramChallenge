//
//  PhotoCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    // MARK: - UI
    
    let imageView = UIImageView()
    
    let maskingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        view.isHidden = true
        
        return view
    }()
    
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
        [imageView, maskingView]
            .forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        [imageView, maskingView]
            .forEach { $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
                }
            }
    }
    
    // MARK: - Func
    
    func updateCell(_ image: UIImage) {
        imageView.image = image
    }
    
    func updateMasking(_ isSelected: Bool) {
        maskingView.isHidden = isSelected
    }
}
