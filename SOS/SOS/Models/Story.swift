//
//  Story.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Story {
    var id: Int
    var title: String
    var body: String
    var timeAdded: String
    var phoneNum: String
    init() {
        id = 0
        title = ""
        body = ""
        timeAdded = ""
        phoneNum = ""
    }
    
    init(title: String, body: String, phoneNum: String) {
        id = 0
        timeAdded = ""
        self.title = title
        self.body = body
        self.phoneNum = phoneNum
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
        timeAdded = json["timeAdded"].stringValue
        phoneNum = json["phoneNum"].stringValue
    }

    func getDict() -> [String: Any] {
        return ["title": title, "body": body, "phoneNum": phoneNum]
    }
}

class Stories: NSObject {
    override init() {}
    var array: Array = Array<Story>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = Story(json:json)
            array.append(tempObject)
        }
    }
}



