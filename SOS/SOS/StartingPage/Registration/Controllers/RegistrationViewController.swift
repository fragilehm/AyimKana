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
import Contacts
import ContactsUI

class RegistrationViewController: UIViewController, UITextViewDelegate, CNContactPickerDelegate {
    var contactId = 1
    let generalColor = UIColor.init(netHex: 0xBDBDBD).cgColor
    
    var contactImageView = UIImageView()
    var contactImg = UIImage(named: "contactIcon")
    //contactImageView.image = contactImg
    //contactImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
    //view.addSubview(contactImageView)
    
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.layer.borderWidth = 1
            //doneButton.layer.cornerRadius = 8
            doneButton.layer.borderColor = generalColor
            //doneButton.layer.masksToBounds = false

            //doneButton.layer.shadowColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            //doneButton.layer.shadowOpacity = 0.8;
            //doneButton.layer.shadowRadius = 12;
            //doneButton.layer.shadowOffset = CGSize(12.0)
        }
    }
    @IBOutlet weak var firstContact: UITextField! {
        didSet {
            firstContact.layer.borderWidth = 1
            firstContact.layer.cornerRadius = 2
            firstContact.layer.borderColor = generalColor
//            contactImageView.image = contactImg
//            contactImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//            firstContact.leftView = contactImageView
//            firstContact.leftViewMode = UITextFieldViewMode.always
//            view.addSubview(contactImageView)
        }
    }
    @IBOutlet weak var secondContact: UITextField! {
        didSet {
            secondContact.layer.borderWidth = 1
            secondContact.layer.cornerRadius = 2
            secondContact.layer.borderColor = generalColor
//            contactImageView.image = contactImg
//            contactImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//            secondContact.leftView = contactImageView
//            secondContact.leftViewMode = UITextFieldViewMode.always
//            view.addSubview(contactImageView)
        }
    }
    @IBOutlet weak var thirdContact: UITextField! {
        didSet {
            thirdContact.layer.borderWidth = 1
            thirdContact.layer.cornerRadius = 2
            thirdContact.layer.borderColor = generalColor
//            contactImageView.image = contactImg
//            contactImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//            thirdContact.leftView = contactImageView
//            thirdContact.leftViewMode = UITextFieldViewMode.always
//            view.addSubview(contactImageView)
        }
    }
    @IBOutlet weak var fourthContact: UITextField! {
        didSet {
            fourthContact.layer.borderWidth = 1
            fourthContact.layer.cornerRadius = 2
            fourthContact.layer.borderColor = generalColor
//            contactImageView.image = contactImg
//            contactImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//            fourthContact.leftView = contactImageView
//            fourthContact.leftViewMode = UITextFieldViewMode.always
//            view.addSubview(contactImageView)
        }
    }
    
    @IBOutlet weak var alertMessageTextView: UITextView! {
        didSet {
            alertMessageTextView.layer.borderWidth = 1
            //alertMessageTextView.layer.cornerRadius = 8
            alertMessageTextView.layer.borderColor = generalColor
            alertMessageTextView.placeholder = "message"
            alertMessageTextView.placeholderColor = UIColor.init(netHex: 0x6E7185)
        }
    }
//    @IBOutlet weak var alertMessageTextView: UITextField!{
//        didSet {
//            alertMessageTextView.layer.borderWidth = 1
//            alertMessageTextView.layer.cornerRadius = 8
//            alertMessageTextView.layer.borderColor = generalColor
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index, name) in DataManager.shared.getContacts().enumerated() {
            switch index {
            case 0:
                self.firstContact.text = name
            case 1:
                self.secondContact.text = name
            case 2:
                self.thirdContact.text = name
            default:
                self.fourthContact.text = name
                
            }
        }
        self.alertMessageTextView.text = DataManager.shared.getMessage()
    }
    @IBAction func savePressed(_ sender: Any) {
        var numbers = [String]()
        if firstContact.text != "" {
            numbers.append(firstContact.text!)
        }
        if secondContact.text != "" {
            numbers.append(secondContact.text!)
        }
        if thirdContact.text != "" {
            numbers.append(thirdContact.text!)
        }
        if fourthContact.text != "" {
            numbers.append(fourthContact.text!)
        }
        
        let vc = UIStoryboard(name: "MainPage", bundle: nil).instantiateViewController(withIdentifier: "MainListViewController") as! MainListViewController
        vc.messageComposer.setNumbers(numbers: numbers)
        vc.message = self.alertMessageTextView.text!
        DataManager.shared.setMessage(message: self.alertMessageTextView.text!)
        
//        if (UserDefaults.standard.bool(forKey: "wasLaunched"))
//        {
//            self.navigationController?.popViewController(animated: true)
//        } else {
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
//        }
    }
    
    @IBAction func contact1(_ sender: Any) {
        print("HERE")
        contactId = 1
        openContacts()
    }
    @IBAction func contact2(_ sender: Any) {
        contactId = 2
        openContacts()
    }
    @IBAction func contact3(_ sender: Any) {
        contactId = 3
        openContacts()
    }
    @IBAction func contact4(_ sender: Any) {
        contactId = 4
        openContacts()
    }
    
    func openContacts(){
        let entityType = CNEntityType.contacts
        let authStatus = CNContactStore.authorizationStatus(for: entityType)
        
        if authStatus == CNAuthorizationStatus.notDetermined {
            
            let contactStore = CNContactStore.init()
            contactStore.requestAccess(for: entityType, completionHandler: { (success, nil) in
                
                if success {
                    self.openContactss()
                }
                else {
                    print("Not authorized")
                }
            })
        }
        else if authStatus == CNAuthorizationStatus.authorized {
            self.openContactss()
        }
    }
    func openContactss() {
        let contactPicker = CNContactPickerViewController.init()
        contactPicker.delegate = self as! CNContactPickerDelegate
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true)  {
            
        }
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let fullName = "\(contact.givenName)"
        
        var phoneNo = "Not Available"
        let phoneString = ((((contact.phoneNumbers[0] as AnyObject).value(forKey: "labelValuePair") as AnyObject).value(forKey: "value") as AnyObject).value(forKey: "stringValue"))
        phoneNo = phoneString! as! String
        let cont = Contact(name: fullName, number: phoneNo)
        var index = 0
        switch contactId {
        case 1:
            self.firstContact.text = "\(fullName)"
        case 2:
            index = 1
            self.secondContact.text = "\(fullName)"
        case 3:
            index = 2
            self.thirdContact.text = "\(fullName)"
        default:
            index = 3
            self.fourthContact.text = "\(fullName)"
        }
        DataManager.shared.updateContacts(contact: cont, index: index)

    }
}

