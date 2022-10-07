//
//  AppDelegate.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [LoadMoreViewController()]
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    


}

