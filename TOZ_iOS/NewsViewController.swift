//
//  NewsViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//
import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    var news: [NewsEntity] = [
        NewsEntity(identifier: "1", title: "Pappy has new home!", datePublished: Date(), content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi commodo, ipsum sed pharetra gravida, orci magna rhoncus neque, id pulvinar odio lorem non turpis.", picture: #imageLiteral(resourceName: "dogTemporary")),
        NewsEntity(identifier: "2", title: "Scientists proved that cats are douchebags!", datePublished: Date(), content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi commodo, ipsum sed pharetra gravida, orci magna rhoncus neque, id pulvinar odio lorem non turpis.", picture: #imageLiteral(resourceName: "catTemporary"))] {
                didSet {
                    newsTableView.reloadData()
                }
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.dataSource = self
        newsTableView.delegate = self
        self.newsTableView.backgroundColor = Color.Background.primary
        self.newsTableView.separatorColor = Color.TableView.separator
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

        let cell: NewsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as? NewsTableViewCell)!
        cell.configure(with: news[indexPath.row])

        return cell

    }

}

extension NewsViewController: UITableViewDelegate {

}
