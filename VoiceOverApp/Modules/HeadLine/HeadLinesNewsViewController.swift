//
//  HeadLinesNewsViewController.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class HeadLinesNewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let newsShortCellIdentifier = "HeadlLineTableViewCell"
    
    var category: Category?
    var news: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
