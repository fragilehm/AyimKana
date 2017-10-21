//
//  Semester.swift
//  AUCA-SSC
//
//  Created by ITLabAdmin on 8/23/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Institute {
//    "id": 3,
//    "name": "Сезим Кризисный центр",
//    "category": 2,
//    "phone_1": "+996 (312) 576094",
//    "address": "Кыргызстан, Чуйская область,  г. Бишкек, 10мкр, дом, 33",
//    "longitude": "74.5769445",
//    "latitude": "42.8789274",
//    "phone_2": "+996 (312) 576094",
//    "description": "Защита прав женщин и детей от насилия в семье.\r\nwww.sezim.org\r\nsezim2008@gmail.com",
//    "website": null
    var id: Int
    var name: String
    var category: Int
    var phone_1: String
    var address: String
    var longitude: String
    var latitude: String
    var phone_2: String
    var description: String
    var website: String
    init() {
        id = 0
        name = ""
        description = ""
        category = 0
        phone_1 = ""
        phone_2 = ""
        latitude = ""
        longitude = ""
        address = ""
        website = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        category = json["category"].intValue
        phone_1 = json["phone_1"].stringValue
        phone_2 = json["phone_2"].stringValue
        latitude = json["latitude"].stringValue
        longitude = json["longitude"].stringValue
        address = json["address"].stringValue
        website = json["website"].stringValue
        
    }
}

class Institutes: NSObject {
    override init() {}
    var array: Array = Array<Institute>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = Institute(json:json)
            array.append(tempObject)
        }
    }
    
}


