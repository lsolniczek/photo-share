//
//  UserPhotosView.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit
import SnapKit

class UserPhotosView: UIView {

	let collectionView = UserPhotosCollectionView()

	init() {
		super.init(frame: CGRect.zero)
		setupCollectionView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCollectionView() {
		addSubview(collectionView)
		collectionView.snp.makeConstraints { make in
			make.top.equalTo(self)
			make.right.equalTo(self)
			make.bottom.equalTo(self)
			make.left.equalTo(self)
		}
	}

}
