//
//  DisplayViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import UIKit

// MARK: - Protocols
protocol DisplayViewControllerDelegate {
  func toggleMenuPanel()
  func collapseMenuPanel()
}

class DisplayViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    var delegate: DisplayViewControllerDelegate?
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions & Methods
    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.toggleMenuPanel()
    }
    
}
extension DisplayViewController: SideMenuTableViewControllerDelegate {
    func didSelectChapter(_ chapter: ChapterOne) {
        
    }
    
    
}
