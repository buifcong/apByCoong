//
//  TabbarViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 10/08/2022.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    struct MenuItem {
        let title: String
        let icon: UIImage
        let type: UIViewController.Type
    }
    
    static var menu: [MenuItem] {
        [MenuItem(title: "Trang chủ", icon: #imageLiteral(resourceName: "ic_Reavol"), type: HomeViewController.self),
         MenuItem(title: "Tìm kiếm", icon: #imageLiteral(resourceName: "ic_Search"), type: ReadViewController.self),
         MenuItem(title: "Chạm đọc", icon: #imageLiteral(resourceName: "ic_Read"), type: SearchViewController.self),
         MenuItem(title: "Cá nhân", icon: #imageLiteral(resourceName: "ic_User"), type: AccountViewController.self)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundColor = UIColor.init(named: "bg_primaryColor")
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.init(named: "bg_primaryColor")
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.barTintColor = UIColor.init(named: "primaryColor")
        }
        tabBar.barTintColor = UIColor.brown
        tabBar.tintColor = UIColor.init(named: "primaryColor")
        tabBar.unselectedItemTintColor = UIColor.init(named: "primaryColor")
        styleUIComponents()
        applyLocalization()
    }
    
    func styleUIComponents() {
        for (index, item) in (self.tabBar.items ?? []).enumerated() {
            item.image = TabbarViewController.menu[index].icon
        }
    }
    
    func applyLocalization() {
        for (index, item) in (self.tabBar.items ?? []).enumerated() {
            item.title = TabbarViewController.menu[index].title
        }
    }
    
    private func setupViewControllers() {
        var viewControllers: [UIViewController] = []
        TabbarViewController.menu.forEach { item in
            viewControllers.append(UINavigationController(rootViewController: item.type.init()))
        }
        setViewControllers(viewControllers, animated: false)
    }
  
}


