//
//  UserPhotosViewController.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit
import Photos

class UserPhotosViewController: UIViewController {

	fileprivate var collectionView: UserPhotosCollectionView!
	fileprivate var photosSource: [AssetSource]
	fileprivate var photoManager: PhotoManager
    
    fileprivate lazy var createCollectionButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add,
                               target: self,
                               action: #selector(UserPhotosViewController.createCollection))
    }()

	init(photoManager: PhotoManager) {
		self.photoManager = photoManager
		self.photosSource = self.photoManager.fetchAssets(withOptions: UserPhotosService.fetchOptions)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		let v = view as! UserPhotosView
		collectionView = v.collectionView
		collectionView.delegate = self
		collectionView.dataSource = self
    }

	override func loadView() {
		view = UserPhotosView()
	}
    
    fileprivate func showCreateCollectionButton() {
        navigationItem.rightBarButtonItem = createCollectionButton
    }
    
    fileprivate func hideCreateCollectionButton() {
        navigationItem.rightBarButtonItem = nil
    }
    
    fileprivate func isShareAssetCollectionEmpty() -> Bool {
        guard let shareAssetCollection = collectionView.indexPathsForSelectedItems
            else { return false }
        return shareAssetCollection.isEmpty
    }
    
    @objc private func createCollection() {
        
    }
}

extension UserPhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isShareAssetCollectionEmpty() { showCreateCollectionButton() }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isShareAssetCollectionEmpty() { hideCreateCollectionButton() }
    }

}

extension UserPhotosViewController: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return photosSource.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return photosSource[section].assets.count
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
		                                                                        withReuseIdentifier: headerViewName,
		                                                                        for: indexPath) as! UserPhotosSectionTitleReusableView
		let asset = photosSource[indexPath.section]
		supplementaryView.header.text = DateUtil.formatter.string(from: asset.key)
		return supplementaryView

	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userPhotosCellName,
		                                              for: indexPath) as! UserPhotosCollectionViewCell
		let asset = photosSource[indexPath.section].assets[indexPath.row]
		photoManager.requestImage(withAsset: asset, options: UserPhotosService.imageRequestOptions) { photo in
			cell.thumbanil = photo.image
		}
		return cell
	}
}
