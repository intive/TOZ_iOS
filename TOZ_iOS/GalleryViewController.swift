//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class GalleryViewController: UIViewController {
    @IBOutlet weak var imageView: UIImage!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    /*
    let urlStr = "https://static.pexels.com/photos/347721/pexels-photo-347721.jpeg"
    var url: NSURL! //
    //var url:URL! //
    var placeholderImageView: UIImageView!
    var img:UIImage!
    var refreshCtrl: UIRefreshControl!
    var tableData:[AnyObject]!
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache:NSCache<AnyObject, AnyObject>!
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        url = NSURL(string:urlStr)
        let data = NSData(contentsOf: url as URL)
        self.imageView.image = UIImage(data: data as Data!)
        */
        PhotoManager.shared.getPhoto(from: "https://static.pexels.com/photos/347721/pexels-photo-347721.jpeg")
    }

}
