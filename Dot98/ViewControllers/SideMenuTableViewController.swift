//
//  SideMenuTableViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import UIKit

// MARK: - Protocols
protocol SideMenuTableViewControllerDelegate {
  func didSelectChapter(_ chapter: ChapterOne)
}

class SideMenuTableViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet weak var menuTableView: UITableView!
    
    var chapters: [ChapterOne] = []
    var delegate: SideMenuTableViewControllerDelegate?

    let chapterController = ChapterController()
    
    
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
    
    
}
