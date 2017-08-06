//
//  UICollectionView+itemSize.swift
//  photo-share
//
//  Created by Lukasz on 30/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit

extension UICollectionView {

	static let finalItemSize: CGSize = {
		let value = UIScreen.main.bounds.width / 4
		return CGSize(width: value, height: value)
	}()

}
