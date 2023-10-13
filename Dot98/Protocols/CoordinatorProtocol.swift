//
//  CoordinatorProtocol.swift
//  Dot98
//
//  Created by Jake Connerly on 10/13/23.
//

import UIKit

protocol Coordinator: AnyObject {
    // var childCoordinators: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }
    
    //func start()
}

