//
//  SelectPhotoViewController.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/08/05.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagraChallenge. All rights reserved.
//

import UIKit
import Photos

class SelectPhotoViewController: UIViewController {

    // MARK: - Property
    
    let selectPhotoView = SelectPhotoView()
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager = PHCachingImageManager()
    var images = [UIImage]()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = selectPhotoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        checkPhotoAuth()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "새 게시물"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    func configureViewController() {
        self.tabBarController?.tabBar.isHidden = true
        
        selectPhotoView.collectionView.delegate = self
        selectPhotoView.collectionView.dataSource = self
        
    }
    
    func loadPhotos() {
        let collectionList = PHAssetCollection.fetchAssetCollections(
            with: .smartAlbum,
            subtype: .smartAlbumUserLibrary,
            options: nil)
        guard let assetCollection = collectionList.firstObject else {
            return
        }
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        fetchResult = PHAsset.fetchAssets(in: assetCollection, options: fetchOptions)
        
        fetchResult.enumerateObjects { object, _, _ in
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            options.deliveryMode = .highQualityFormat
            
            let width = (UIScreen.main.bounds.width - 6) / 4
            
            self.imageManager.requestImage(
                for: object,
                targetSize: CGSize(width: width, height: width),
                contentMode: .aspectFill,
                options: nil) { image, _ in
                    guard let image = image else {
                        return
                    }
                    
                    self.images.append(image)
                }
        }
        
        selectPhotoView.mainImageView.image = images[0]
    }

    func checkPhotoAuth() {
        let photoAuth = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuth {
        case .authorized:
            loadPhotos()
            selectPhotoView.collectionView.reloadData()
        case .denied:
            presentBasicAlert("권한 설정이 필요합니다.")
            self.dismiss(animated: true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ status in
                switch status {
                case .authorized:
                    self.loadPhotos()
                    self.selectPhotoView.collectionView.reloadData()
                case .denied:
                    self.presentBasicAlert("권한 설정이 필요합니다.")
                    self.dismiss(animated: true)
                default: break
                }
            })
        default: break
        }
    }
}

// MARK: - CollectionView

extension SelectPhotoViewController: UICollectionViewDelegate,
                                     UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int
    {
        return fetchResult?.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        let image = images[indexPath.item]
        cell.updateCell(image)
        
        if indexPath.item == 0 {
            cell.updateMasking(false)
        }
    
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        selectPhotoView.mainImageView.image = images[indexPath.item]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell else {
            return
        }
        
        guard let firstCell = collectionView.cellForItem(
            at: IndexPath(item: 0, section: 0)) as? PhotoCell else {
            return
        }
        firstCell.updateMasking(true)
        
        cell.updateMasking(false)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didDeselectItemAt indexPath: IndexPath)
    {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell else {
            return
        }
        
        cell.updateMasking(true)
    }
    
}
