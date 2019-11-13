//
//  AppDelegate.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DependencyInjection.instance.container.registerServices()
        setNavigationAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: EnterCardRouter.createModule())
        window?.makeKeyAndVisible()
        return true
    }
    
    private func setNavigationAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.systemGreen
    }
}

