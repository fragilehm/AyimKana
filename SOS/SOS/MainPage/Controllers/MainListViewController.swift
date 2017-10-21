//
//  MainListViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController {

    var data = ["Informations", "Services", "Pins", "SMS"]
    @IBOutlet weak var mainListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainListTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

}
extension MainListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainListTableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as! MainListTableViewCell
        cell.nameLabel.text = data[indexPath.row]
        return cell
    }
    
    
}
