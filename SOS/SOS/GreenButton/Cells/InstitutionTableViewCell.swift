
//  IntstitutionTableViewCell.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class InstitutionTableViewCell: UITableViewCell {
    
    //let tap = UITapGestureRecognizer(target: self, action: #selector(InstitutionTableViewCell.tapFunction))
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
//    {
//        didSet {
//            phoneLabel.isUserInteractionEnabled = true
//            phoneLabel.addGestureRecognizer(tap)
//        }
//    }
    @IBOutlet weak var phoneLabel2: UILabel!
    @IBOutlet weak var centreDescription: UILabel!
    
    @objc func tapFunction (sender: UITapGestureRecognizer)
    {
        print("Tap Tap")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //phoneLabel.isUserInteractionEnabled = true
        //phoneLabel.addGestureRecognizer(tap)
        // Initialization code
    }
    
    
}

