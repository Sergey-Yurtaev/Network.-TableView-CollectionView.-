//
//  TabBarViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 02.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "image" {
            tabBar.barTintColor = .black
        } else {
            tabBar.barTintColor = .white
        }
    }
    
    deinit {
        print("TabBarViewController has been dealocated")
    }
}



