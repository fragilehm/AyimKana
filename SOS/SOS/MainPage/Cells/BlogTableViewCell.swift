//
//  BlogTableViewCell.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.masksToBounds = true
            backView.layer.cornerRadius = 5
            backView.layer.borderWidth = 2
            backView.layer.borderColor = UIColor.darkGray.cgColor
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
