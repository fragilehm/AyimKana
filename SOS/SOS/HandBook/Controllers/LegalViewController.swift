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
    let aColor = UIColor.init(netHex: 0xBDBDBD).cgColor
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    @IBOutlet weak var legalLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        legalLabel.text = text
        legalLabel.backgroundColor = UIColor.white
        legalLabel.layer.borderWidth = 1
        legalLabel.layer.borderColor = aColor
        legalLabel.layer.cornerRadius = 2
        
        // Do any additional setup after loading the view.
    }

}
