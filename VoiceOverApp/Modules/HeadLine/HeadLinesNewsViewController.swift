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
        
        guard let newsCategory = category else {
            return
        }
        
        title = newsCategory.name
        setupTableView(with: newsCategory)
    }
    
    
    func setupTableView(with category: Category) {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let categoryName = category == .technology ? "Tech": category.name
        setupNews(for: categoryName)
    }
    
    func setupNews(for category: String) {
        do {
            let newsData: [NewsModel] = try JsonRequester.getMockObjectArray(fileName: category)
            self.news = newsData
            
            tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let new = sender as? NewsModel,
            let viewController = segue.destination as? NewsDetailViewController else {
                return
        }
        
        viewController.new = new
    }
}

extension HeadLinesNewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsShortCellIdentifier, for: indexPath) as? HeadlLineTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(with: news[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: news[indexPath.row])
    }
}
