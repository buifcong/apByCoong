//
//  TabbarController.swift
//  Telegram_Dev
//
//  Created by bùi thành công on 02/09/2022.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBarController()
        let settingNavi = UINavigationController(rootViewController: SettingViewController())
        let chatNavi = UINavigationController(rootViewController: ChatViewController())
        let contactNavi = UINavigationController(rootViewController: ContactViewController())
        tabbar.viewControllers = [contactNavi,chatNavi,settingNavi]
        
    }
    

}
