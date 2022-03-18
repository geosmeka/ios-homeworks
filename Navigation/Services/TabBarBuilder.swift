//
//  TabBarBuilder.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class TabBarBuilder {
    static func build () -> UITabBarController {
        
        let feedViewController = FeedViewController ()
        let loginViewController = LogInViewController()
        
        let tabBarController = UITabBarController ()
        let feedNavigationController = UINavigationController (rootViewController: feedViewController)
        let profileNavidationController = UINavigationController (rootViewController: loginViewController)
        
        let feedItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 0)
        
        feedNavigationController.tabBarItem = feedItem
        profileNavidationController.tabBarItem = profileItem
       
        tabBarController.setViewControllers([feedNavigationController, profileNavidationController], animated: true)
        
        return tabBarController
    }
    
}
