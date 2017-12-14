//
//  WhatToDoTableViewCell.swift
//  SOS
//
//  Created by ITLabAdmin on 11/30/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class WhatToDoTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.numberOfLines = 0
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(text: String) {
        self.textLabel?.text = text
        self.textLabel?.numberOfLines = 0
    }
    
    func setHeader() {
        self.textLabel?.textColor = UIColor.init(netHex: 0x578C88)
        self.textLabel?.font =  self.textLabel?.font.withSize(18)
    }
    
    func setTitle() {
        self.textLabel?.textColor = UIColor.gray
        self.textLabel?.font =  self.textLabel?.font.withSize(14)
    }

}
