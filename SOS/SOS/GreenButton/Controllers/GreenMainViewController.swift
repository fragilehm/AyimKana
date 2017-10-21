//
//  GreenMainViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class GreenMainViewController: UIViewController {

    @IBOutlet weak var greenCategoryTableView: UITableView!
    
    var categories = Categories()
    override func viewDidLoad() {
        super.viewDidLoad()
        greenCategoryTableView.tableFooterView = UIView()
        ServerManager.shared.getAllCategories(setCategories, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    
    func setCategories(categories: Categories) {
        self.categories = categories
        greenCategoryTableView.reloadData()
    }
}
extension GreenMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = greenCategoryTableView.dequeueReusableCell(withIdentifier: "GreenCategoryTableViewCell", for: indexPath) as! GreenCategoryTableViewCell
        cell.titleLabel.text = categories.array[indexPath.row].name
        cell.descriptionLabel.text = categories.array[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Green", bundle: nil).instantiateViewController(withIdentifier: "InstitutionViewController") as! InstitutionViewController
        vc.id = categories.array[indexPath.row].id
        self.navigationController?.show(vc, sender: self)
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
    
}
