//  NewsViewController.swift
//  TOZ_iOS
//  TOZPATRON-25


import UIKit
import Foundation

class NewsViewController: UIViewController {


    @IBOutlet weak var tableViewNews: UITableView!

    var dataSource: NewsDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsExample = News(title: "Tytul", dataPublish: Date(), messageShort: "Message", picture: nil)
        dataSource = NewsDataSource(news: [newsExample])
        tableViewNews.dataSource = dataSource
        tableViewNews.delegate = dataSource as UITableViewDelegate?

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewNews.reloadData()

    }





}
