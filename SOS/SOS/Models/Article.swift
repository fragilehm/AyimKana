//
//  Semester.swift
//  AUCA-SSC
//
//  Created by ITLabAdmin on 8/23/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    var id: Int
    var title: String
    var image_url: String
    var body: String
    var last_updated: String
    init() {
        id = 0
        title = ""
        img_url = ""
        body = ""
        last_updated = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        image_url = json["image_url"].stringValue
        body = json["body"].stringValue
        last_updated = json["last_updated"].stringValue
        
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



