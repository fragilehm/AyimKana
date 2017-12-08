//
//  DataManager.swift
//  AUCA-SSC
//
//  Created by Admin on 8/18/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


struct Contact {
    var name : String
    var number : String
}

class DataManager {
    
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    var contacts = [Contact].init(repeating:  Contact(name: "", number: ""), count: 4)
    
    var message = ""
    
    func updateContacts(contact: Contact, index: Int)
    {
        self.contacts[index] = contact
    }
    
    func getContacts() -> [Contact]
    {
        return contacts
    }
    func getNumbers() -> [String] {
        var nums = [String]()
        for contact in contacts {
         nums.append(contact.number)
        }
        return nums
    }
//    func appendPhone(phone: String) {
//        phones.append(phone)
//    }
//    func appendName(name: String) {
//        phones.append(name)
//    }
//    func getPhones() -> [String]{
//        return phones
//    }
//    func getNames() -> [String]{
//        return names
//    }
    func setMessage(message: String){
        self.message = message
    }
    func getMessage() -> String {
        return self.message
    }
    func clearData(){
        self.contacts.removeAll()
        //self.phones.removeAll()
        //self.names.removeAll()
        
    }
}
