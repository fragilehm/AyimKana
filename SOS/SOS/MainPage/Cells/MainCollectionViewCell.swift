//
//  MainCollectionViewCell.swift
//  SOS
//
//  Created by Khasanza on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 5
        cardView.layer.masksToBounds = true
        // Initialization code
    }
    @IBAction func showDescriptionPressed(_ sender: Any) {
        
    }
    func fillCell(title: String, imageName: String, description: String){
        titleLabel.text = title
        mainImageView.image = UIImage(named: imageName)
        
    }
    
}
