//
//  SettingsTableViewCell.swift
//  SOS
//
//  Created by Risolat Fayzmamadova on 3/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var settingsIcon: UIImageView!
    @IBOutlet weak var settingsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
