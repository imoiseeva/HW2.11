//
//  NewsTableViewController.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
   private var news = [Post]()


    override func viewDidLoad() {
        super.viewDidLoad()
        

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
        cell.contentConfiguration = content

        return cell
    }
    



}
