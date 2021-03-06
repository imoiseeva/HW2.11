//
//  NewsTableViewController.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import UIKit
import Alamofire

class NewsTableViewController: UITableViewController {
    
    private var news = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchData(from: URLS.api.rawValue)
        print(news)
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
        content.secondaryText = String(new.points ?? 5)
        cell.contentConfiguration = content
        
        return cell
    }
   
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) {  result in

           self.news.append(contentsOf: result.hits)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
 
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let url = news[indexPath.row].url
        let detailVC = segue.destination as! DetailViewController
        detailVC.urlForWebView = url ?? "error"
    }
    
    
    }
    



