//
//  NewsCategoriesViewController.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/14/20.
//

import UIKit

class NewsCategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categoría"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let category = sender as? Category,
            let viewController = segue.destination as? HeadLinesNewsViewController else {
                return
        }
        
        viewController.category = category
    }
}

extension NewsCategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoryTableViewCell,
            let category = Category(rawValue: indexPath.row) else {
                return UITableViewCell()
        }
        
        cell.setup(with: category)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let category = Category(rawValue: indexPath.row) else {
            return
        }
        
        performSegue(withIdentifier: "showHeadLineNews", sender: category)
    }
    
}
