//
//  SettingsViewController.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingsTableView: UITableView!
    var settingsNames = ["Language", "About Aiymkana"]
    var settingsIcons = ["", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        settingsTableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCellId") as! SettingsTableViewCell
        //cell.settingsIcon.image = UIImage(named: "")
        cell.settingsNameLabel.text = settingsNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingsNames[indexPath.row] == "Language" {
            //self.navigationController?.show(ChangeLanguageViewController(), sender: self)
        }
        else {
            //self.navigationController?.show(getVC(storyboard: "AboutApp", name: "AboutAppViewController"), sender: self)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
