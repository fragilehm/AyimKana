//
//  LanguagesTableViewCell.swift
//  SOS
//
//  Created by ITLabAdmin on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LanguagesTableViewCell: UITableViewCell {

    @IBOutlet weak var languageNameLabel: UILabel!
    @IBOutlet weak var checkedIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
