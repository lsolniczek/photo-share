//
//  UserPhotosService.swift
//  photo-share
//
//  Created by Lukasz on 30/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import Foundation
import Photos

protocol PhotoManager {
	func fetchAssets(withOptions options: PHFetchOptions) -> [AssetSource]
	func requestImage(withAsset asset: PHAsset, options: PHImageRequestOptions, handler: @escaping (Photo) -> Void)
}

class UserPhotosService: PhotoManager {

	private let imageManager = PHImageManager()

	static let fetchOptions: PHFetchOptions = {
		let options = PHFetchOptions()
		options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
		options.predicate = NSPredicate(format: "mediaType == $PHOTO").withSubstitutionVariables(["PHOTO": 1])
		return options
	}()

	static let imageRequestOptions: PHImageRequestOptions = {
		let itemSize = UICollectionView.finalItemSize
		let options = PHImageRequestOptions()
		options.deliveryMode = .opportunistic
		options.resizeMode = .exact
		options.normalizedCropRect = CGRect(x: 0.0, y: 0.0, width: itemSize.width, height: itemSize.height)
		return options
	}()

	func fetchAssets(withOptions options: PHFetchOptions) -> [AssetSource] {
		let fetchResult = PHAsset.fetchAssets(with: options)
		var resultDic: [Date: [PHAsset]] = [:]
		fetchResult.enumerateObjects({ (asset, _, _) in
            let dateKey = DateUtil.shorten(date: asset.creationDate!)
            resultDic[dateKey, default: []].append(asset)
		})
		return resultDic
            .map { (key, assets) -> AssetSource in
                return AssetSource(key: key, assets: assets)
            }.sorted { (as1, as2) in
                return as1.key > as2.key
            }
	}

	func requestImage(withAsset asset: PHAsset, options: PHImageRequestOptions, handler: @escaping (Photo) -> Void) {
		let targetSize = UICollectionView.finalItemSize
		imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill,
		                          options: options) { (image, metaData) in
			guard let image = image else { return }
			let inCloud = metaData?[PHImageResultIsInCloudKey] as? Bool ?? false
			let photo = Photo(image: image, inCloud: inCloud)
			handler(photo)
		}
	}
}
