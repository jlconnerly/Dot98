//
//  ChapterOneViewController.swift
//  Dot98
//
//  Created by Jake Connerly on 6/30/21.
//

import UIKit

class ChapterOneViewController: UIViewController {

    @IBOutlet weak var chapterOneTitleLabel: UILabel!
    @IBOutlet weak var chapterOneContentTextView: UITextView!
    
    let chapterModel = ChapterOneTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapterOneTitleLabel.text = chapterModel.title
        chapterOneContentTextView.text = chapterModel.titleContent
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
