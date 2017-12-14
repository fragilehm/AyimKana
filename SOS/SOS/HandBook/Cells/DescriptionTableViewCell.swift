//
//  DescriptionTableViewCell.swift
//  SOS
//
//  Created by ITLabAdmin on 12/8/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var wtdDescriptionLabel: UILabel!

    @IBOutlet weak var wtdDescriptionView: UIView!
    {
        didSet {
            wtdDescriptionView.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            wtdDescriptionView.layer.borderWidth = 0.5
            wtdDescriptionView.layer.cornerRadius = 2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
