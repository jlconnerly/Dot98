//
//  SectionsViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/23/20.
//

import UIKit

class SectionsViewController: UIViewController {
    
    @IBOutlet weak var sectionsTableView: UITableView!
    var sections: [Section]? {
        didSet {
            sectionsTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
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
extension SectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath)
        guard let sections = sections else { return UITableViewCell() }
        let sectionTitle = sections[indexPath.row].sectionTitle
        cell.textLabel?.text = sectionTitle
        return cell
    }
}
