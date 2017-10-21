//
//  Location.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

struct Location {
    
    var latitude: Double
    var longitude: Double
    
    init(latitude: String, longitude: String) {
        self.latitude = (latitude as NSString).doubleValue
        self.longitude = (longitude as NSString).doubleValue
    }
    func toDict() -> [String: Any]
    {
        return ["longitude": longitude,
                "latitude": latitude]
    }
}
