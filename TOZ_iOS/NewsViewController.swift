//
//  NewsViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!

    var news: [NewsEntity] =  [
        NewsEntity(identifier: "1", title: "News Tile First", datePublished: Date(), content: "Here is a message long long long", picture: UIImage(named: "Aerial01")),
        NewsEntity(identifier: "2", title: "News Tile Second", datePublished: Date(), content: "Here is a second message long long long", picture: nil),
        NewsEntity(identifier: "3", title: "News Tile Third", datePublished: Date(), content: "Here is a third message long long long", picture: UIImage(named: "Aerial03"))] {

            didSet {
                newsTableView.reloadData()
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.dataSource = self
        newsTableView.delegate = self

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
