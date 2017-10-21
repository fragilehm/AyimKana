//
//  RegistrationViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import UITextView_Placeholder
import QuartzCore

class RegistrationViewController: UIViewController, UITextViewDelegate {

    let generalColor = UIColor.init(netHex: 0x9C627F).cgColor
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.layer.borderWidth = 1
            doneButton.layer.cornerRadius = 8
            doneButton.layer.borderColor = generalColor
        }
    }
    @IBOutlet weak var firstContact: UITextField! {
        didSet {
            firstContact.layer.borderWidth = 1
            firstContact.layer.cornerRadius = 8
            firstContact.layer.borderColor = generalColor
        }
    }
    @IBOutlet weak var secondContact: UITextField! {
        didSet {
            secondContact.layer.borderWidth = 1
            secondContact.layer.cornerRadius = 8
            secondContact.layer.borderColor = generalColor
        }
    }
    @IBOutlet weak var thirdContact: UITextField! {
        didSet {
            thirdContact.layer.borderWidth = 1
            thirdContact.layer.cornerRadius = 8
            thirdContact.layer.borderColor = generalColor
        }
    }
    @IBOutlet weak var fourthContact: UITextField! {
        didSet {
            fourthContact.layer.borderWidth = 1
            fourthContact.layer.cornerRadius = 8
            fourthContact.layer.borderColor = generalColor
        }
    }
    
    @IBOutlet weak var alertMessageTextView: UITextView!{
        didSet {
            alertMessageTextView.layer.borderWidth = 1
            alertMessageTextView.layer.cornerRadius = 8
            alertMessageTextView.layer.borderColor = generalColor
            alertMessageTextView.placeholder = "Введите сообщение, которое будет отправлено вашим близкимю."
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
