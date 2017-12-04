//
//  Semester.swift
//  AUCA-SSC
//
//  Created by ITLabAdmin on 8/23/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Actions {
    var id: Int
    var title: String
    var behave: String
    var expect: String
    var qa: String
    init() {
        id = 0
        title = ""
        behave = ""
        expect = ""
        qa = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        behave = json["behave"].stringValue
        expect = json["expect"].stringValue
        qa = json["qa"].stringValue
    }
}
struct Article {
    var id: Int
    var title: String
    var image_url: String
    var description: String
    var legal: String
    var last_updated: String
    var actions = [Actions]()
    init() {
        id = 0
        title = ""
        image_url = ""
        description = ""
        last_updated = ""
        legal = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        image_url = json["image_url"].stringValue
        description = json["description"].stringValue
        last_updated = json["last_updated"].stringValue
        legal = json["legal"].stringValue
        for actionJson in json["actions"].arrayValue {
            actions.append(Actions(json: actionJson))
        }
    }
}

class Articles: NSObject {
    override init() {}
    var array: Array = Array<Article>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = Article(json:json)
            array.append(tempObject)
        }
    }
}



