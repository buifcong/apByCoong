//
//  AppDelegate.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 21/07/2022.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import FirebaseAuth

@main

class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [HomeViewController()]
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        
        
        
        FirebaseApp.configure()
        
        FirebaseMessaging.Messaging.messaging().delegate = self
        //MARK: Đăng kí nhận thông báo từ xa
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, _ in
            guard success else {
                return
            }
            print("success in APNS")
        }
        application.registerForRemoteNotifications()
        
        
        
        //MARK: ====================
        Messaging.messaging().subscribe(toTopic: "News_dev_all") { error in
            
        }
        
        
        return true
    }
    
    
    //MARK: =======================
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else {
                return
            }
            print("Token: \(token)")
            User.FCMToken = token
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        

                // set the view controller as root
                self.window?.rootViewController = TapnotifyViewController()
        

    }
    
    
}
//extension AppDelegate {
//    func presenScreen(){
//
//    }
//}
