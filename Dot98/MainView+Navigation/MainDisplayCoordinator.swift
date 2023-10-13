//
//  MainDisplayCoordinator.swift
//  Dot98
//
//  Created by Jake Connerly on 10/13/23.
//

import UIKit

class MainDisplayCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        let mainDetailDisplayVC = MainDisplayViewController.instantiate()
        let tabBarImage = UIImage(systemName: "house.fill")
        mainDetailDisplayVC.tabBarItem = UITabBarItem(title: "Home", image: tabBarImage, tag: 0)
        navigationController.viewControllers = [mainDetailDisplayVC]
    }
    
}
