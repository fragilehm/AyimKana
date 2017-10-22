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

class DataManager {
    
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    var phones: [String]?
    func setPhones(phones: [String]) {
        self.phones = phones
    }
    func getPhones() -> [String]{
        return phones!
    }
}
