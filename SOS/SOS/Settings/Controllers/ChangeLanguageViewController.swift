//
//  ChangeLanguageViewController.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ChangeLanguageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var languagesTableView: UITableView!
    var selectedIndex: Int = -1
    var selected = false
    
    var languages = ["Русский", "Кыргызча"]
    var selectLanguages = ["Язык", "Тил"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Language"
        languagesTableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
    }
    
    @objc func doneTapped(sender: UIBarButtonItem) {
        
        let lang  = DataManager.shared.getLanguage()
        
        if selectedIndex == 0 {
            DataManager.shared.setLanguage(language: "ru")
            //self.navigationItem.rightBarButtonItem?.title = "language".localized(lang: "ru")!
            //self.collectionView.reloadData()
            self.navigationController?.popViewController(animated: true)
            MainViewController().changeLanguageMainMenu(aLang: "ru")
            
        }
        else if selectedIndex == 1 {
            DataManager.shared.setLanguage(language: "ky")
            //self.navigationItem.title = Translation.mainMenu
            //self.collectionView.reloadData()
            self.navigationController?.popViewController(animated: true)
            MainViewController().changeLanguageMainMenu(aLang: "ky")

        }
        else {
            self.navigationController?.popViewController(animated: true)
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
