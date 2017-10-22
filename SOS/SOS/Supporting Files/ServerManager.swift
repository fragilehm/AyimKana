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
    
    func getAllCategories(_ completion: @escaping (Categories)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "categories", completion: { (json) in
            completion(Categories(json: json))
        }, error: error)
    }
    func getInstitutesById(id: Int, _ completion: @escaping (Institutes)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "servicesByCat/\(id)/", completion: { (json) in
            completion(Institutes(json: json))
        }, error: error)
    }
    func getArticles(_ completion: @escaping (Articles)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "infos", completion: { (json) in
            completion(Articles(json: json))
        }, error: error)
    }
//    func addCourse(course: Course, completion: @escaping ()-> Void,error: @escaping (String)-> Void) {
//        let param = course.toDict()
//
//        post(api: "addCourse",
//             parameters: param, completion: {(json) in
//            self._simplifiedCourses = nil
//            completion()
//            }
//        , error: error)
//    }
//
}
