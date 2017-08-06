//
//  AppCoordinator.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit

class AppCoordinator {

	private let rootViewController: UINavigationController

	init(rootViewController: UINavigationController) {
		self.rootViewController = rootViewController
	}

	func start() {
		let userPhotosVC = UserPhotosViewController(photoManager: UserPhotosService())
		rootViewController.pushViewController(userPhotosVC, animated: false)
	}
}
