//
//  ViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lang = DataManager.shared.getLanguage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.shared.setLanguage()
    }
}
