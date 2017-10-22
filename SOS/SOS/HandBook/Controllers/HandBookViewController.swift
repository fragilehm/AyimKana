//
//  HandBookViewController.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class HandBookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var articles = Articles()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        ServerManager.shared.getArticles(setArticles, error: showErrorAlert)
        // Do any additional setup after loading the view.
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "HandBook", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailsViewController")
    }
}
