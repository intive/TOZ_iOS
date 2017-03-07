//
//  NewsDataSource.swift
//  TOZ_iOS
//
//  Created by RKB on 05/03/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit



class NewsDataSource: NSObject {
 
    var news:[News]
    
    init( news:[News]) {
        self.news = news
    }
    
}

extension NewsDataSource: UITableViewDataSource {
    

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

extension NewsDataSource: UITableViewDelegate {
    
}
