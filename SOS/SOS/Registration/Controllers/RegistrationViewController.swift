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

    let colorForEmergency = UIColor(red: 243.0/255.0, green: 95.0/255.0, blue: 98.0/255.0, alpha: 1.0).cgColor
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    //{
//        didSet {
//            scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "SecondRegistrationImage")!)
////                UIImage(named: "SecondRegistrationImage")
//        }
//    }
    
    
    @IBOutlet weak var contact1NameTextField: UITextField! {
        didSet {
            contact1NameTextField.layer.borderWidth = 1
            contact1NameTextField.layer.cornerRadius = 5
            contact1NameTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact1PhoneNumberTextField: UITextField! {
        didSet {
            contact1PhoneNumberTextField.layer.borderWidth = 1
            contact1PhoneNumberTextField.layer.cornerRadius = 5
            contact1PhoneNumberTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact1EmailTextField: UITextField! {
        didSet {
            contact1EmailTextField.layer.borderWidth = 1
            contact1EmailTextField.layer.cornerRadius = 5
            contact1EmailTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact2NameTextField: UITextField! {
        didSet {
            contact2NameTextField.layer.borderWidth = 1
            contact2NameTextField.layer.cornerRadius = 5
            contact2NameTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact2PhoneNumberTextField: UITextField! {
        didSet {
            contact2PhoneNumberTextField.layer.borderWidth = 1
            contact2PhoneNumberTextField.layer.cornerRadius = 5
            contact2PhoneNumberTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact2EmailTextField: UITextField! {
        didSet {
            contact2EmailTextField.layer.borderWidth = 1
            contact2EmailTextField.layer.cornerRadius = 5
            contact2EmailTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact3NameTextField: UITextField! {
        didSet {
            contact3NameTextField.layer.borderWidth = 1
            contact3NameTextField.layer.cornerRadius = 5
            contact3NameTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact3PhoneNumberTextField: UITextField! {
        didSet {
            contact3PhoneNumberTextField.layer.borderWidth = 1
            contact3PhoneNumberTextField.layer.cornerRadius = 5
            contact3PhoneNumberTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact3EmailTextField: UITextField! {
        didSet {
            contact3EmailTextField.layer.borderWidth = 1
            contact3EmailTextField.layer.cornerRadius = 5
            contact3EmailTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact4NameTextField: UITextField! {
        didSet {
            contact4NameTextField.layer.borderWidth = 1
            contact4NameTextField.layer.cornerRadius = 5
            contact4NameTextField.layer.borderColor = colorForEmergency
        }
    }
    @IBOutlet weak var contact4PhoneNumberTextField: UITextField! {
        didSet {
            contact4PhoneNumberTextField.layer.borderWidth = 1
            contact4PhoneNumberTextField.layer.cornerRadius = 5
            contact4PhoneNumberTextField.layer.borderColor = colorForEmergency
        }
    }
    
    @IBOutlet weak var contact4EmailTextField: UITextField! {
        didSet {
            contact4EmailTextField.layer.borderWidth = 1
            contact4EmailTextField.layer.cornerRadius = 5
            contact4EmailTextField.layer.borderColor = colorForEmergency
        }
    }
    
   
    @IBOutlet weak var RecordAudioSwitch: UISwitch!
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.layer.borderWidth = 1
            doneButton.layer.cornerRadius = 5
            doneButton.layer.borderColor = colorForEmergency
        }
    }
    
    @IBOutlet weak var alertMessageTextView: UITextView!{
        didSet {
            alertMessageTextView.layer.borderWidth = 2.0
            alertMessageTextView.layer.borderColor = colorForEmergency
            alertMessageTextView.placeholder = "Enter a message that will be sent to emergency contacts"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "SecondRegistrationImage")!)
        self.view.contentMode = .scaleAspectFit
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
