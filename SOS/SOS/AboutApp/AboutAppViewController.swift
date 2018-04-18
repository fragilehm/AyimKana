//
//  AboutAppViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {
    
    let lang = DataManager.shared.getLanguage()
    
    @IBOutlet weak var aboutAppTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutAppTextLabel.text = "about_app_text".localized(lang: lang)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = "AboutApp".localized(lang: DataManager.shared.getLanguage())!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
