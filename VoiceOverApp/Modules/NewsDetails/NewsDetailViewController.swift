//
//  NewsDetailViewController.swift
//  AccessibilityNews
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    enum NewsDetailSection: Int {
        case image
        case title
        case information
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let newsImageCellIdentifier = "NewsDetailImageTableViewCell"
    let newsTitleCellIdentifier = "NewsDetailTitleTableViewCell"
    let newsInfoCellIdentifier = "NewsInformationTableViewCell"
    let numberOfRowsInSection = 3
    
    var new: NewsModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let new = new else {
            return
        }
        
        setupTableView(with: new)
    }
    
    func setupTableView(with new: NewsModel) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension NewsDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        new != nil ? numberOfRowsInSection: 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = NewsDetailSection(rawValue: indexPath.row),
        let new = new  else {
            return UITableViewCell()
        }
        
        switch section {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: newsImageCellIdentifier, for: indexPath) as? NewsDetailImageTableViewCell
            cell?.setup(with: new)
            return cell ?? UITableViewCell()
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: newsTitleCellIdentifier, for: indexPath) as? NewsDetailTitleTableViewCell
            cell?.setup(with: new)
            return cell ?? UITableViewCell()
        case .information:
            let cell = tableView.dequeueReusableCell(withIdentifier: newsInfoCellIdentifier, for: indexPath) as? NewsInformationTableViewCell
            cell?.setup(with: new)
            return cell ?? UITableViewCell()
        }
    }
}
