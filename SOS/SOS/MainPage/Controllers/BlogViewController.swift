//
//  BlogViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit


class BlogViewController: UIViewController {

    @IBOutlet weak var blogTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        blogTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

}
extension BlogViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = blogTableView.dequeueReusableCell(withIdentifier: "BlogTableViewCell", for: indexPath) as! BlogTableViewCell
        return cell
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
    
}
