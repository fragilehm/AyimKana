//
//  InstitutionViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class InstitutionViewController: UIViewController {
    
    @IBOutlet weak var institutionTableView: UITableView!
    var institutes = Institutes()
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        institutionTableView.tableFooterView = UIView()
        ServerManager.shared.getInstitutesById(id: id, setInstitutes, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    func setInstitutes(institutes: Institutes){
        self.institutes = institutes
        institutionTableView.reloadData()
    }


}
extension InstitutionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return institutes.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = institutionTableView.dequeueReusableCell(withIdentifier: "InstitutionTableViewCell", for: indexPath) as! InstitutionTableViewCell
        cell.nameLabel.text = institutes.array[indexPath.row].name
        cell.descriptionLabel.text = institutes.array[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 90
    //    }
    
}

