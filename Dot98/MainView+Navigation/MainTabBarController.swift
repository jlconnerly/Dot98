//
//  MainTabBarController.swift
//  Dot98
//
//  Created by Jake Connerly on 10/13/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    let mainDisplayCoordinator = MainDisplayCoordinator()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            mainDisplayCoordinator.navigationController
        ]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
