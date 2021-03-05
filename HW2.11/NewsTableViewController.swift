//
//  NewsTableViewController.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var news = [Post]()
    
    //let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: URLS.api.rawValue)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let new = news[indexPath.row]
        content.text = new.title
        content.secondaryText = String(new.points)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) {  result in
            self.news.append(contentsOf: result.hits)
            self.tableView.reloadData()
        }
    }
    
}


