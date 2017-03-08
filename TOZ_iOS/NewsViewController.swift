//
//  NewsViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableViewNews: UITableView!
    var news:[News] =  [News(title: "Tytul", dataPublish: Date(), messageShort: "Message", picture: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewNews.register(NewsTableViewCell.self, forCellReuseIdentifier: "news_cell")
        tableViewNews.dataSource = self
        tableViewNews.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewNews.reloadData()
        
    }
    
}



extension NewsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as! NewsTableViewCell
        
        //cell configuration
        cell.title.text = news[indexPath.row].title
        cell.messageShort.text = news[indexPath.row].messageShort
        cell.dataPublish.text = String(describing: news[indexPath.row].dataPublish)
        return cell
        
    }
    
}

extension NewsViewController: UITableViewDelegate {
    
}
