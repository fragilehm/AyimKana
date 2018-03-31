//
//  StoriesPage.swift
//  SOS
//
//  Created by Mamadnazar on 3/31/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct StoriesPage {
    var count: Int
    var previous: String?
    var next: String?
    var results = [Story]()
    
    init() {
        count = 0
        previous = ""
        next = ""
    }
    
    init(json: JSON) {
        count = json["count"].intValue
        previous = json["previous"].stringValue
        next = json["next"].stringValue
        for storyJson in json["results"].arrayValue {
            results.append(Story(json: storyJson))
        }
    }
}

class StoriesPages: NSObject {
    override init() {}
    var array: Array = Array<StoriesPage>()
    init(json: JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            let tempObject = StoriesPage(json:json)
            array.append(tempObject)
        }
    }
}

