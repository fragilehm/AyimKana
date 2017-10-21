//
//  MainListViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController {

    var names = ["Справочник", "Учреждения", "Опасные зоны", "СМС", "Контакты"]
    var descriptions = ["СправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждения", "УчреждеСправочникУчрежденияУчрежденияУчрежденияУчрежденияУчрежденияния", "ОпаСправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждениясные зоны", "ССправочникУчрежденияУчрежденияУчрежденияУчрежденияУчрежденияМС", "СправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждения"]
    var storyboards = ["HandBook", "Green", "Pins", "SMS", "Registration"]
    var vcs = ["HandBookViewController", "GreenMainViewController", "PinsViewController", "SMSViewController",
               "RegistrationViewController"]
    @IBOutlet weak var mainListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainListTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

}
extension MainListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainListTableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as! MainListTableViewCell
        cell.nameLabel.text = names[indexPath.row]
        cell.descriptionTextView.text = descriptions[indexPath.row]
        cell.logoImageView.image = UIImage(named: "main\(indexPath.row)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.show(getVC(storyboard: storyboards[indexPath.row], name: vcs[indexPath.row]), sender: self)
    }
    func getVC(storyboard: String, name: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name)
    }
}
