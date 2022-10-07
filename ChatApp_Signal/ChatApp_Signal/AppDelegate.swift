//
//  AppDelegate.swift
//  ChatApp_Signal
//
//  Created by bùi thành công on 18/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [ChatViewController()]
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
    
}

