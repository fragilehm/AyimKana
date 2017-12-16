//
//  GreenMainViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class GreenMainViewController: UIViewController {

    let lang: String = DataManager.shared.getLanguage()
    
    @IBOutlet weak var greenCategoryTableView: UITableView!
    //let tap = UITapGestureRecognizer(target: self, action: #selector(GreenMainViewController.tapFunction))
    
    var categories = Categories()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "second_cell".localized(lang: lang)!
        greenCategoryTableView.estimatedRowHeight = 100
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
    
//    @objc func tapFunction (sender: UITapGestureRecognizer)
//    {
//        print("Tap Tap")
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = greenCategoryTableView.dequeueReusableCell(withIdentifier: "GreenCategoryTableViewCell", for: indexPath) as! GreenCategoryTableViewCell
        cell.titleLabel.text = categories.array[indexPath.row].name
        cell.descriptionLabel.text = categories.array[indexPath.row].description
        //cell.categoryImageView.image = UIImage(named: "category\(indexPath.row)")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = UIStoryboard(name: "Green", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.id = categories.array[indexPath.row].id
        vc.category = categories.array[indexPath.row].name
        self.navigationController?.show(vc, sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
