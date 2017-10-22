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
    
    @IBOutlet weak var alertMessageTextView: UITextField!{
        didSet {
            alertMessageTextView.layer.borderWidth = 1
            alertMessageTextView.layer.cornerRadius = 8
            alertMessageTextView.layer.borderColor = generalColor
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index, phone) in DataManager.shared.getNames().enumerated() {
            switch index {
            case 0:
                self.firstContact.text = phone
            case 1:
                self.secondContact.text = phone
            case 2:
                self.thirdContact.text = phone
            default:
                self.fourthContact.text = phone
                
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
        vc.messageComposer.setNumbers(numbers: DataManager.shared.getPhones())
        vc.message = self.alertMessageTextView.text!
        DataManager.shared.setMessage(message: self.alertMessageTextView.text!)
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)

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
        DataManager.shared.appendPhone(phone: phoneNo)
        DataManager.shared.appendName(name: fullName)

        switch contactId {
        case 1:
            self.firstContact.text = "\(fullName)"
        case 2:
            self.secondContact.text = "\(fullName)"
        case 3:
            self.thirdContact.text = "\(fullName)"
        default:
            self.fourthContact.text = "\(fullName)"

        }
    }
}

