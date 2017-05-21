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
    var selectedNewsItem: NewsItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.rowHeight = UITableViewAutomaticDimension
        self.newsTableView.estimatedRowHeight = 300
        self.newsTableView.backgroundColor = Color.Cell.Background.primary
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNewsItem = localNewsList[indexPath.row]
        performSegue(withIdentifier: "newsDetailSegue", sender: selectedNewsItem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsDetailSegue" {
            let newsDetailViewController = segue.destination as? NewsDetailViewController
            newsDetailViewController?.selectedNews = self.selectedNewsItem

        }
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
