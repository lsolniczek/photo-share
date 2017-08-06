//
//  UserPhotosCollectionViewFlowLayout.swift
//  photo-share
//
//  Created by Lukasz on 30/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit

class UserPhotosCollectionViewFlowLayout: UICollectionViewFlowLayout {

	override init() {
		super.init()
		minimumLineSpacing = 0.0
		minimumInteritemSpacing = 0.0
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
