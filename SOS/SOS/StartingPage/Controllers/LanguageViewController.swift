//
//  LanguageViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import PickerView

class LanguageViewController: UIViewController, PickerViewDataSource, PickerViewDelegate  {
    
    @IBOutlet var languageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languagePickerView: PickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    var languages = ["Русский", "Кыргызча"]
    var selectLanguages = ["Язык", "Тил"]
    var titles = ["Добро пожаловать!", "Кош келиниз!"]
    var buttonTitles = ["Далее", "Кийинки"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        languagePickerView.selectionStyle = .defaultIndicator
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if languagePickerView.currentSelectedIndex == 0 {
            DataManager.shared.setLanguage(language: "ru")
            showMainPage()
        }
        else {
            DataManager.shared.setLanguage(language: "ky")
            showMainPage()
        }
    }
    
    func showMainPage(){
        let sb = UIStoryboard(name: "StartingPage", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PageViewController")
        present(vc, animated: true, completion: nil)
    }
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return languages.count
    }
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        let item = languages[index]
        return item
    }
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 60
    }
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        
        nextButton.setTitle(buttonTitles[index], for: .normal)
        titleLabel.text = titles[index]
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
}

