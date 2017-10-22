//
//  ArticleDetailsViewController.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    var article: Article?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = article?.title
        self.timeLabel.text = article?.last_updated
        self.bodyLabel.text = article?.body
        let url = URL(string: (article?.image_url)!)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        self.imageView.image = image
        // Do any additional setup after loading the view.
    }


}
