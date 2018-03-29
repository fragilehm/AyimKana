//
//  ChangeLanguageViewController.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import PickerView

class ChangeLanguageViewController: UIViewController, PickerViewDataSource, PickerViewDelegate {

    @IBOutlet weak var languagePV: PickerView!
    
    var languages = ["Русский", "Кыргызча"]
    var selectLanguages = ["Язык", "Тил"]
    var titles = ["Добро пожаловать!", "Кош келиниз!"]
    var buttonTitles = ["Далее", "Кийинки"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Language"
        
        languagePV.dataSource = self
        languagePV.delegate = self
        languagePV.selectionStyle = .defaultIndicator
        languagePV.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    @IBAction func nextButtonPressed(_ sender: Any) {
//        if languagePickerView.currentSelectedIndex == 0 {
//            DataManager.shared.setLanguage(language: "ru")
//            showMainPage()
//        }
//        else {
//            DataManager.shared.setLanguage(language: "ky")
//            showMainPage()
//        }
//    }
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return languages.count
    }
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        let item = languages[index]
        return item
    }
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 30
    }
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        
        //nextButton.setTitle(buttonTitles[index], for: .normal)
        self.title = "Changed"
    }
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25.0)
        if highlighted {
            label.textColor = .black
        } else {
            label.textColor = .lightGray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
