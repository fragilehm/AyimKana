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
    //var contacts = [Contact].init(repeating:  Contact(name: "", number: ""), count: 4)
    var names = [String].init(repeating:  "", count: 4)
    var phones = [String].init(repeating:  "", count: 4)
    var message = ""
    func updateContacts(contact: Contact, index: Int)
    {
        if let contact_names = UserDefaults.standard.object(forKey: "contact_names") as? [String],
            let contact_phones = UserDefaults.standard.object(forKey: "contact_phones") as? [String]{
            for (i, name) in contact_names.enumerated() {
                names[i] = name
                phones[i] = contact_phones[i]
            }
        }
        names[index] = contact.name
        phones[index] = contact.number
        UserDefaults.standard.set(names, forKey: "contact_names")
        UserDefaults.standard.set(phones, forKey: "contact_phones")
    }
    
    func getContacts() -> [String]
    {
        var numbers = UserDefaults.standard.object(forKey: "contact_names") as? [String]
        if numbers == nil {
            numbers = phones
        }
        return numbers!
    }
    func getNumbers() -> [String] {
        var nums = [String]()
        var numbers = UserDefaults.standard.object(forKey: "contact_phones") as? [String]
        if numbers == nil {
            numbers = phones
        }
        for number in numbers! {
            if number != "" {
                nums.append(number)
            }
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
        UserDefaults.standard.setValue(message, forKey: "message")
    }
    func getMessage() -> String {
        if let m = UserDefaults.standard.object(forKey: "message") as? String {
            return m
        }
        return self.message
    }
    func clearData(){
        //self.phones.removeAll()
        //self.names.removeAll()
        
    }
}
