//
//  TabBarBuilder.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class TabBarBuilder {
    static func build () -> UITabBarController {
        
        let tabBarController = UITabBarController ()
        let feedNavigationController = UINavigationController ()
        let profileNavidationController = UINavigationController ()
        
        let feedItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 0)
        
        feedNavigationController.tabBarItem = feedItem
        profileNavidationController.tabBarItem = profileItem
        
        let feedViewController = FeedViewController ()
        let profileViewController = ProfileViewController ()
        
        feedNavigationController.pushViewController(feedViewController, animated: true)
        profileNavidationController.pushViewController(profileViewController, animated: true)
        tabBarController.setViewControllers([feedNavigationController, profileNavidationController], animated: true)
        
        return tabBarController
    }
    
}
