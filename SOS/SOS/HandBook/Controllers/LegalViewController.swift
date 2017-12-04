//
//  LegalViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 11/30/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class LegalViewController: UIViewController {
    var text: String?
    @IBOutlet weak var legalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        legalLabel.text = text
        // Do any additional setup after loading the view.
    }

}
