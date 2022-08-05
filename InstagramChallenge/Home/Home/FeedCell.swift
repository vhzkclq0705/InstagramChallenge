//
//  FeedCell.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/03.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit

import SnapKit

class FeedCell: UITableViewCell {
    
    static let identifier = "FeedCell"
    
    // MARK: - UI
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.addTarget(
            self,
            action: #selector(didTapEllipsisButton(_:)),
            for: .touchUpInside)
        
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(
            ImageSlideCell.self,
            forCellWithReuseIdentifier: ImageSlideCell.identifier)
        
        return collectionView
    }()
    
    let slideCountLabel: PaddingLabel = {
        let label = PaddingLabel(
            padding: UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        label.isHidden = true
        
        return label
    }()
    
    let iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        return stackView
    }()
    
    lazy var heartButton = createIcons("heart")
    
    lazy var chatButton = createIcons("chat")
    
    lazy var shareButton = createIcons("send")
    
    lazy var markButton = createIcons("mark")
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.customColor(.enabled)
        
        return pageControl
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        
        return stackView
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 77개"
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var commentsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.addTarget(
            self,
            action: #selector(didTapCommentsButton(_:)),
            for: .touchUpInside)
        
        return button
    }()
    
    let smallProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var writingCommentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("댓글 달기...", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(
            self,
            action: #selector(didTapCommentsButton(_:)),
            for: .touchUpInside)
        
        return button
    }()
    
    let emoticonsLabel: UILabel = {
        let label = UILabel()
        label.text = "❤️    🙌    ⨁"
        label.textColor = .lightGray
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    // MARK: - Property
    
    var ellipsisButtonTapHandler: (() -> Void)?
    var contents = [Contents]()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func prepareForReuse() {
        slideCountLabel.isHidden = true
    }
    
    // MARK: - Setup
    
    func addViews() {
        [
            heartButton,
            chatButton,
            shareButton,
        ]
            .forEach { iconStackView.addArrangedSubview($0) }
        
        [
            likesLabel,
            contentLabel,
            commentsButton,
        ]
            .forEach { contentStackView.addArrangedSubview($0) }
        
        [
            profileImageView,
            nicknameLabel,
            ellipsisButton,
            collectionView,
            slideCountLabel,
            iconStackView,
            pageControl,
            markButton,
            contentStackView,
            smallProfileImageView,
            writingCommentsButton,
            emoticonsLabel,
            dateLabel
        ]
            .forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(30)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        ellipsisButton.snp.makeConstraints {
            $0.centerY.equalTo(nicknameLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(collectionView.snp.width)
        }
        
        slideCountLabel.snp.makeConstraints {
            $0.top.trailing.equalTo(collectionView).inset(20)
        }
        
        iconStackView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        [
            heartButton,
            chatButton,
            shareButton,
        ]
            .forEach {
                $0.snp.makeConstraints {
                    $0.width.height.equalTo(24)
                }
            }
        
        pageControl.snp.makeConstraints {
            $0.centerY.equalTo(iconStackView)
            $0.centerX.equalToSuperview()
        }
        
        markButton.snp.makeConstraints {
            $0.centerY.equalTo(iconStackView)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(iconStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        smallProfileImageView.snp.makeConstraints {
            $0.top.equalTo(contentStackView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(25)
        }
        
        writingCommentsButton.snp.makeConstraints {
            $0.centerY.equalTo(smallProfileImageView)
            $0.leading.equalTo(smallProfileImageView.snp.trailing).offset(10)
        }
        
        emoticonsLabel.snp.makeConstraints {
            $0.centerY.equalTo(smallProfileImageView)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(smallProfileImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    // MARK: - Func
    
    func updateCell(_ feed: Feed) {
        contents = feed.contentsList
        fetchImages()
        nicknameLabel.text = feed.loginID
        contentLabel.text = feed.loginID + " " + (feed.text ?? "")
        dateLabel.text = feed.createdAt.caculateDiff()
        commentsButton.setTitle("댓글 \(feed.commentsCount)개 모두 보기", for: .normal)
    }
    
    func fetchImages() {
        if contents.count > 1 {
            slideCountLabel.isHidden = false
        }
        
        pageControl.numberOfPages = contents.count
        slideCountLabel.text = "\(1)/\(contents.count)"
        collectionView.reloadData()
    }
    
    func createIcons(_ name: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        
        return button
    }
    
    // MARK: - Action
    
    @objc func didTapEllipsisButton(_ sender: Any) {
        ellipsisButtonTapHandler?()
    }
    
    @objc func didTapCommentsButton(_ sender: Any) {
        print("댓글")
        // TODO: 댓글 화면 이동
    }
}

// MARK: - CollectionView

extension FeedCell: UICollectionViewDelegate,
                    UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int
    {
        return contents.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageSlideCell.identifier,
            for: indexPath) as? ImageSlideCell else {
            return UICollectionViewCell()
        }
        
        let url = contents[indexPath.item].url
        cell.updateCell(url)
        
        return cell
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        
        pageControl.currentPage = page
        slideCountLabel.text = "\(page + 1)/\(contents.count)"
    }
    
}
