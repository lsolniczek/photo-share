//
//  AppDelegate.swift
//  photo-share
//
//  Created by Lukasz on 29/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var appCoordinator: AppCoordinator!

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		let rootViewController = UINavigationController()
		window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator = AppCoordinator(rootViewController: rootViewController)
		appCoordinator.start()
		window?.rootViewController = rootViewController
		window?.makeKeyAndVisible()

		return true
	}
}

