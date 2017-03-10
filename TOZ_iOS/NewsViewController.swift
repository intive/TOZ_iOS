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
        
        tableViewNews.dataSource = self
        tableViewNews.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}



extension NewsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath)
        
        if let cell = cell as? NewsTableViewCell {
            configure(forNews: news[indexPath.row], setCell: cell)
        }
        
        return cell
        
    }
    
    func configure(forNews: News, setCell: NewsTableViewCell) {
        setCell.title.text = forNews.title
        setCell.messageShort.text = forNews.messageShort
        setCell.dataPublish.text = String(describing: forNews.dataPublish)
    }
    
}

extension NewsViewController: UITableViewDelegate {
    
}
