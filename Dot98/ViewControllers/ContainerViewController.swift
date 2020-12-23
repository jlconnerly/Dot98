//
//  ContainerViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/22/20.
//

import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    var displayNavigationController: UINavigationController!
    var displayViewController: DisplayViewController!
    var menuTableViewController: SideMenuTableViewController?
    let menuExpandedOffset: CGFloat = 90
    var isMenuDisplayed = false {
        didSet {
            let shouldShowShadow = isMenuDisplayed != false
            showShadowForDisplayViewController(shouldShowShadow)
        }
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initDisplayViewController()
        setPanGestureRecogniser()
    }
    
    // MARK: - IBActions & Methods
    private func initDisplayViewController() {
        displayViewController = UIStoryboard.displayViewController()
        displayViewController.delegate = self
        displayNavigationController = UINavigationController(rootViewController: displayViewController)
        view.addSubview(displayNavigationController.view)
        addChild(displayNavigationController)
        displayNavigationController.didMove(toParent: self)
    }
    
    func animateCenterPanelXPosition(
        targetPosition: CGFloat,
        completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                self.displayNavigationController.view.frame.origin.x = targetPosition
            },
            completion: completion)
    }
    
    func showShadowForDisplayViewController(_ shouldShowShadow: Bool) {
        if shouldShowShadow {
            displayNavigationController.view.layer.shadowOpacity = 1.0
            displayNavigationController.view.layer.masksToBounds = false
        } else {
            displayNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    
    private func setPanGestureRecogniser() {
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePanGesture(_:)))
        displayNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
}

// MARK: - Extensions
extension ContainerViewController: DisplayViewControllerDelegate {
    // MARK: - Menu Panel
    func toggleMenuPanel() {
        if !isMenuDisplayed {
            addMenuPanelViewController()
        }
        animateMenuPanel(shouldExpand: true)
    }

    func addMenuPanelViewController() {
        guard menuTableViewController == nil else { return }
        if let vc = UIStoryboard.menuViewController() {
            //vc.animals = Animal.allCats()
            addChildMenuPanelController(vc)
            menuTableViewController = vc
        }
    }
    
    func addChildMenuPanelController(_ menuPanelController: SideMenuTableViewController) {
        view.insertSubview(menuPanelController.view, at: 0)
        addChild(menuPanelController)
        menuPanelController.didMove(toParent: self)
        menuPanelController.delegate = displayViewController
    }
    
    func animateMenuPanel(shouldExpand: Bool) {
      if shouldExpand {
        isMenuDisplayed = true
        animateCenterPanelXPosition(
          targetPosition: displayNavigationController.view.frame.width
            - menuExpandedOffset)
      } else {
        animateCenterPanelXPosition(targetPosition: 0) { _ in
          self.isMenuDisplayed = false
          self.menuTableViewController?.view.removeFromSuperview()
          self.menuTableViewController = nil
        }
      }
    }
    
    func collapseMenuPanel() {
        if isMenuDisplayed {
            toggleMenuPanel()
        }
    }
}

// MARK: - Gesture recognizer
extension ContainerViewController: UIGestureRecognizerDelegate {
  @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
    let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)

    switch recognizer.state {
    case .began:
      if !isMenuDisplayed {
        if gestureIsDraggingFromLeftToRight {
          addMenuPanelViewController()
        }
        showShadowForDisplayViewController(true)
      }

    case .changed:
      if let rview = recognizer.view {
        rview.center.x = rview.center.x + recognizer.translation(in: view).x
        recognizer.setTranslation(CGPoint.zero, in: view)
      }

    case .ended:
      if let _ = menuTableViewController,
        let rview = recognizer.view {
        // animate the menu panel open or closed based on whether the view
        // has moved more or less than halfway
        let hasMovedGreaterThanHalfway = rview.center.x > view.bounds.size.width
        animateMenuPanel(shouldExpand: hasMovedGreaterThanHalfway)
      }

    default:
      break
    }
  }
}

// MARK: - Storyboard Extension
private extension UIStoryboard {
  static func mainDisplayStoryboard() -> UIStoryboard { return UIStoryboard(name: "MainDisplay", bundle: Bundle.main) }
  
  static func menuViewController() -> SideMenuTableViewController? {
    return mainDisplayStoryboard().instantiateViewController(withIdentifier: "SideMenuTableViewController") as? SideMenuTableViewController
  }
  
  static func displayViewController() -> DisplayViewController? {
    return mainDisplayStoryboard().instantiateViewController(withIdentifier: "DisplayViewController") as? DisplayViewController
  }
}
