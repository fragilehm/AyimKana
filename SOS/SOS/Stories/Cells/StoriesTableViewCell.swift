//
//  StoriesTableViewCell.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
  
    
    @IBOutlet weak var storyDate: UILabel!

    @IBOutlet weak var storyContentView: UIView! {
        didSet {
            storyContentView.layer.borderWidth = 0.5
            storyContentView.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            storyContentView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var storyContentLabel: UILabel!
//    {
//        didSet {
//            storyContentLabel.layer.borderWidth = 0.7
//            storyContentLabel.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
//            storyContentLabel.layer.cornerRadius = 5
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
