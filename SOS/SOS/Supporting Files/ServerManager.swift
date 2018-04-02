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
    
    func getAllStories(_ completion: @escaping (Stories)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "stories", completion: { (json) in
            completion(Stories(json: json))
        }, error: error)
    }
    
    func getAllStoriesByPage(page_num: Int,_ completion: @escaping (StoriesPage)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "v2/stories/?page=\(page_num)&page_size=3", completion: { (json) in
            completion(StoriesPage(json: json))
        }, error: error)
    }
    
    func addStories(story: Story,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "stories/", parameters: story.getDict(), completion: { (json) in
            completion()
        }) { (message) in
            print(message)
        }
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
    func getPins(_ completion: @escaping (Pins)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "pins", completion: { (json) in
            completion(Pins(json: json))
        }, error: error)
    }
    func addPins(pin: Pin,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        print(pin.getDict())
        self.post(api: "pins/", parameters: pin.getDict(), completion: { (json) in
            completion()
        }) { (message) in
            print(message)
        }
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
