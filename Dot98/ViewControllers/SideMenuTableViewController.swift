//
//  SideMenuTableViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import UIKit

class SideMenuTableViewController: UIViewController {
    
    @IBOutlet weak var chaptersTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        chaptersTableView.delegate = self
        chaptersTableView.dataSource = self
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
