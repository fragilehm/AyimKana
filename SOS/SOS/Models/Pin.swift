//
//  Pin.swift
//  SOS
//
//  Created by ITLabAdmin on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Pin {
    var id: Int
    var info: String
    var latitude: String
    var longitude: String
    
    init() {
        id = 0
        info = ""
        latitude = ""
        longitude = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        info = json["info"].stringValue
        latitude = json["latitude"].stringValue
        longitude = json["longitude"].stringValue
        
    }
    func getDict() -> [String: Any] {
        return ["info": info, "latitude": latitude, "longitude": longitude]
    }
}

class Pins: NSObject {
    override init() {}
    var array: Array = Array<Pin>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = Pin(json:json)
            array.append(tempObject)
        }
    }
    
}

