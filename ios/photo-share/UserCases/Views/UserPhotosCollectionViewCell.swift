//
//  UserPhotosCollectionViewCell.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit
import SnapKit

let userPhotosCellName = String(describing: UserPhotosCollectionViewCell.self)

class UserPhotosCollectionViewCell: UICollectionViewCell {

	private var imageView = UIImageView()
    private var highlightView = UIView()
	var thumbanil: UIImage? {
		didSet {
			guard let thumbanil = thumbanil else { return }
			imageView.image = thumbanil
		}
	}
    
    override var isSelected: Bool {
        didSet {
            highlightView.isHidden = !isSelected
        }
    }

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
        setuphighlightView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    private func setuphighlightView() {
        highlightView.isHidden = true
        highlightView.backgroundColor = UIColor.white
        highlightView.alpha = 0.7
        addSubview(highlightView)
        highlightView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
    }

	private func setupCell() {
		imageView.contentMode = .scaleToFill
		addSubview(imageView)
		imageView.snp.makeConstraints { make in
			make.left.equalTo(self).offset(1)
            make.right.equalTo(self)
			make.top.equalTo(self).offset(1)
            make.bottom.equalTo(self)
		}
	}
}
