//
//  ChangeLanguageViewController.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ChangeLanguageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    let lang: String = DataManager.shared.getLanguage()
        
    @IBOutlet weak var languagesTableView: UITableView!
    var selectedIndex: Int = -1
    var selected = false
    
    var languages = ["Русский", "Кыргызча"]
    var selectLanguages = ["Язык", "Тил"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Language".localized(lang: lang)!
        languagesTableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done".localized(lang: lang)!, style: .done, target: self, action: #selector(doneTapped))
    }
    
   
    @objc func doneTapped(sender: UIBarButtonItem) {
        if (HTTPRequestManager().isConnectedToNetwork()) {
            if selectedIndex == 0 {
                DataManager.shared.setLanguage(language: "ru")
                MainViewController().changeLanguageMainMenu(aLang: "ru")
                self.navigationController?.popViewController(animated: true)
            }
            else if selectedIndex == 1 {
                DataManager.shared.setLanguage(language: "ky")
                MainViewController().changeLanguageMainMenu(aLang: "ky")
                self.navigationController?.popViewController(animated: true)
            }
            else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        else {
            let alert = UIAlertController(title: "Warning".localized(lang: lang)!, message: "If you want to change the language you should be connected to the internet".localized(lang: lang)!, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguagesTableViewCellId") as! LanguagesTableViewCell
        cell.languageNameLabel.text = languages[indexPath.row]
        if selectedIndex == indexPath.row {
                cell.checkedIcon.isHidden = false
        } else {
            cell.checkedIcon.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.languagesTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
