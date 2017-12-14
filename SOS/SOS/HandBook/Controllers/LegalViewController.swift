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
    @IBOutlet weak var legalView: UIView!
    {
        didSet {
            legalView.layer.borderWidth = 0.5
            legalView.layer.borderColor = aColor
            legalView.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        legalLabel.text = text
        
        // Do any additional setup after loading the view.
    }

}
