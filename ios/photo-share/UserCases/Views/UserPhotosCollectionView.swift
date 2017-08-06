//
//  UserPhotosCollectionView.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit

class UserPhotosCollectionView: UICollectionView {

	let itemSize: CGSize

	init(collectionViewLayout: UserPhotosCollectionViewFlowLayout = UserPhotosCollectionViewFlowLayout(),
	     cellClass: UICollectionViewCell.Type = UserPhotosCollectionViewCell.self,
	     headerView: UserPhotosSectionTitleReusableView.Type = UserPhotosSectionTitleReusableView.self) {

		// set item size
		self.itemSize = UICollectionView.finalItemSize
		collectionViewLayout.itemSize = self.itemSize
		collectionViewLayout.headerReferenceSize = CGSize(width: 50, height: 30)

		super.init(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)

		//register cell and header for collection view
		register(cellClass, forCellWithReuseIdentifier: userPhotosCellName)
		register(headerView, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewName)
		backgroundColor = UIColor.white
        allowsMultipleSelection = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
