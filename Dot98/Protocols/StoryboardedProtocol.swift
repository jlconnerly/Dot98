//
//  StoryboardedProtocol.swift
//  Dot98
//
//  Created by Jake Connerly on 10/13/23.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "MainDisplay", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
