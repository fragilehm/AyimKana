//
//  ServerManager.swift
//  OpenSport
//
//  Created by Sanira on 12/3/16.
//  Copyright © 2016 TimelySoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServerManager: HTTPRequestManager  {

    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    
    func getAllCategories(_ completion: @escaping (ContactTypes)-> Void, error: @escaping (String)-> Void) {
        
        if _contactTypes != nil {
            completion(_contactTypes!)
            return
        }
        
        self.get(api: "getAllContactTypes", completion: { (json) in
            let obj = ContactTypes(json: json)
            self._contactTypes = obj
            completion(obj)
        }, error: error)
    }
    
    func addCourse(course: Course, completion: @escaping ()-> Void,error: @escaping (String)-> Void) {
        let param = course.toDict()
        
        post(api: "addCourse",
             parameters: param, completion: {(json) in
            self._simplifiedCourses = nil
            completion()
            }
        , error: error)
    }
   
}
