//
//  MainPageViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var greenView: UIView! {
        didSet {
            greenView.layer.masksToBounds = true
            greenView.layer.cornerRadius = 65
        }
    }
    @IBOutlet weak var yellowView: UIView! {
        didSet {
            yellowView.layer.masksToBounds = true
            yellowView.layer.cornerRadius = 65
        }
    }
    @IBOutlet weak var redView: UIView! {
        didSet {
            redView.layer.masksToBounds = true
            redView.layer.cornerRadius = 65
        }
    }
    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.layer.masksToBounds = true
            borderView.layer.cornerRadius = 5
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
