//
//  UserPhotosSectionTitleReusableView.swift
//  photo-share
//
//  Created by Lukasz on 31/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit
import SnapKit

let headerViewName = String(describing: UserPhotosSectionTitleReusableView.self)

class UserPhotosSectionTitleReusableView: UICollectionReusableView {

	let header = UILabel(frame: CGRect.zero)

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupTitle()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupTitle() {
		addSubview(header)
		header.snp.makeConstraints { make in
			make.left.equalTo(8)
			make.top.equalTo(8)
			make.bottom.equalTo(-8)
		}
	}
}
