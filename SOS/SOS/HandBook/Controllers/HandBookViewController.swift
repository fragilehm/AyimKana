//
//  HandBookViewController.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Kingfisher

class HandBookViewController: UIViewController {
    
    let aColor = UIColor.init(netHex: 0xBDBDBD).cgColor
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var violenceContentView: UIView! {
//        didSet {
//            violenceContentView.backgroundColor = UIColor.white
//            violenceContentView.layer.borderWidth = 1
//            violenceContentView.layer.borderColor = aColor
//            violenceContentView.layer.cornerRadius = 2
//        }
//    }
    
    var articles = Articles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        ServerManager.shared.getArticles(setArticles, error: showErrorAlert)
    }
   
    func setArticles(articles: Articles){
        self.articles = articles
        tableView.reloadData()
    }
    
}
extension HandBookViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HandBookTableViewCell", for: indexPath) as! HandBookTableViewCell
        cell.nameLabel.text = articles.array[indexPath.row].title
        cell.violenceDescriptionLabel.text = articles.array[indexPath.row].description
        
        //let url = URL(string: articles.array[indexPath.row].title)
        //cell.hImg.kf.setImage(with: url)
        //cell.hImg.image = UIImage(named: "sad")
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "HandBook", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.article = self.articles.array[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
        
//        let vc = UIStoryboard(name: "HandBook", bundle: nil).instantiateViewController(withIdentifier: "InformationViewCnotroller") as! ArticleDetailsViewController
//        vc.article = articles[indexPath.row]
//        self.navigationController?.show(vc, sender: self)
    }
}
