//
//  Semester.swift
//  AUCA-SSC
//
//  Created by ITLabAdmin on 8/23/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Category {
    var id: Int
    var name: String
    var description: String
    
    init() {
        id = 0
        name = ""
        description = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        
    }
}

class Categories: NSObject {
    override init() {}
    var array: Array = Array<Category>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = Category(json:json)
            array.append(tempObject)
        }
    }
    
}

