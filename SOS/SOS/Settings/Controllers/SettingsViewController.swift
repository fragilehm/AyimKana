//
//  SettingsViewController.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lang: String = DataManager.shared.getLanguage()
    
    @IBOutlet weak var settingsTableView: UITableView!
    var settingsNames = [String]()
    var settingsIcons = [#imageLiteral(resourceName: "language"), #imageLiteral(resourceName: "aboutApp")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lang = DataManager.shared.getLanguage()
        settingsNames = ["Language".localized(lang: lang)!, "AboutApp".localized(lang: lang)!]
        self.title = "Settings".localized(lang: lang)!
        settingsTableView.reloadData()
        print(lang)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCellId") as! SettingsTableViewCell
        cell.settingsIcon.image = settingsIcons[indexPath.row]
        cell.settingsNameLabel.text = settingsNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingsNames[indexPath.row] == "Language".localized(lang: lang)! {
            let sb = UIStoryboard(name: "Settings", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ChangeLanguageViewController") as! ChangeLanguageViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let sb = UIStoryboard(name: "AboutApp", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
