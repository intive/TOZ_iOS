//
//  NewsViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//
import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newsTableView: UITableView!
    let newsOperation = NewsOperation()
    var localNewsList = [NewsItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.backgroundColor = Color.Background.primary
        self.newsTableView.separatorColor = Color.TableView.separator
        getNews()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return localNewsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath)

        if let cell = cell as? NewsTableViewCell {
            cell.configure(with: localNewsList[indexPath.row])
        }
        return cell
    }

    func getNews() {
        newsOperation.resultCompletion = { result in

            switch result {
            case .success(let newsList):
                DispatchQueue.main.async {
                    self.localNewsList = newsList
                    self.newsTableView.reloadData()
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        newsOperation.start()
    }

}
