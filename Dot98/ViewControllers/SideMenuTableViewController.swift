//
//  SideMenuTableViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import UIKit

protocol SideMenuDelegate {
    func didSelectChapter(_ chapter: ChapterOne)
}

class SideMenuTableViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet weak var menuTableView: UITableView!
    
    var chapters: [ChapterOne] = []
    let chapterController = ChapterController()
    var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        loadChapters()
    }
    
    private func loadChapters() {
        chapterController.loadChapterOne { (result) in
            guard let chapter = try? result.get() else { return }
            self.chapters.append(chapter)
            DispatchQueue.main.async {
                self.menuTableView.reloadData()
            }
        }
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
extension SideMenuTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        cell.textLabel?.text = "Chapter \(chapters[indexPath.row].chapterNumber): \(chapters[indexPath.row].chapterTitle)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let mainStoryboard = UIStoryboard(name: "MainDisplay", bundle: Bundle.main)
//        guard let sectionsVC = mainStoryboard.instantiateViewController(identifier: "SectionsViewController") as? SectionsViewController else { return }
//        sectionsVC.sections = chapters[indexPath.row].sections
//        view.addSubview(sectionsVC.view)
        let chapter = chapters[indexPath.row]
        delegate?.didSelectChapter(chapter)
    }
}

// MARK: - Storyboard Extension
private extension UIStoryboard {
  static func mainDisplayStoryboard() -> UIStoryboard { return UIStoryboard(name: "MainDisplay", bundle: Bundle.main) }
  
  static func menuViewController() -> SideMenuTableViewController? {
    return mainDisplayStoryboard().instantiateViewController(withIdentifier: "SideMenuTableViewController") as? SideMenuTableViewController
  }
}
