//
//  TabbarViewController.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .systemBackground
        tabBar.itemSpacing = .leastNormalMagnitude
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(systemName: "homekit"),
                                         tag: 0)
        
        let favorites = UIViewController()
        favorites.view.backgroundColor = .red
        favorites.tabBarItem = UITabBarItem(title: nil,
                                            image: UIImage(systemName: "heart"),
                                            tag: 0)

        let profile = UIViewController()
        profile.view.backgroundColor = .green
        profile.tabBarItem = UITabBarItem(title: nil,
                                          image: UIImage(systemName: "person"),
                                          tag: 0)

        viewControllers = [homeVC, favorites, profile]
    }
}
