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
    
    func getArticles(_ completion: @escaping (Articles)-> Void, error: @escaping (String)-> Void) {
        
        let data = UserDefaults.standard.data(forKey: "articles")
//        if UserDefaults.standard.bool(forKey: "articlesCached") {
//            completion(Articles(json: JSON(data)))
//            return
//        }
        
        self.get(api: "infos", completion: { (json) in
            completion(Articles(json: json))
        }, error: { (err) in
            if err.contains("Нет подключения к интернету") {
                completion(Articles(json: JSON(data)))
            }
            //error(err)
        }) { (jsonValue) in
            UserDefaults.standard.set(jsonValue, forKey: "articles")
            UserDefaults.standard.set(true, forKey: "articlesCached")
        }
        
    }
    
    func getAllStories(_ completion: @escaping (Stories)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "stories", completion: { (json) in
            completion(Stories(json: json))
        }, error: error) { (json) in
        }
    }
    
    func getAllStoriesByPage(page_num: Int, _ completion: @escaping (StoriesPage)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "v2/stories/?page=\(page_num)&page_size=3", completion: { (json) in
            completion(StoriesPage(json: json))
        }, error: error) { (json) in
        }
    }
    
    func addStories(story: Story,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "stories/", parameters: story.getDict(), completion: { (json) in
            completion()
        }, error: { (message) in
            print(message)
        }) { (json) in
        }
    }
    
    func getAllCategories(_ completion: @escaping (Categories)-> Void, error: @escaping (String)-> Void) {
        
        let data = UserDefaults.standard.data(forKey: "categories")
        //if UserDefaults.standard.bool(forKey: "categoriesCached") {
        //    completion(Categories(json: JSON(data)))
        //    return
        //}
        
        self.get(api: "categories", completion: { (json) in
            completion(Categories(json: json))
        }, error: { (err) in
            if err.contains("Нет подключения к интернету") {
                completion(Categories(json: JSON(data)))
            }
            //error(err)
        }) { (jsonValue) in
            UserDefaults.standard.set(jsonValue, forKey: "categories")
            UserDefaults.standard.set(true, forKey: "categoriesCached")
        }
        
    }
    
    func getInstitutesById(id: Int, _ completion: @escaping (Institutes)-> Void, error: @escaping (String)-> Void) {
        
        let data = UserDefaults.standard.data(forKey: "institutesById")
//        if UserDefaults.standard.bool(forKey: "institutesByIdCached") {
//            completion(Institutes(json: JSON(data)))
//            return
//        }
        
        self.get(api: "servicesByCat/\(id)/", completion: { (json) in
            completion(Institutes(json: json))
        }, error: { (err) in
            if err.contains("Нет подключения к интернету") {
                completion(Institutes(json: JSON(data)))
            }
            //error(err)
        }) { (jsonValue) in
            UserDefaults.standard.set(jsonValue, forKey: "institutesById")
            UserDefaults.standard.set(true, forKey: "institutesByIdCached")
        }
        
    }
    

    func getPins(_ completion: @escaping (Pins)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "pins", completion: { (json) in
            completion(Pins(json: json))
        }, error: error) { (json) in
        }
    }
    
    func addPins(pin: Pin, _ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "pins/", parameters: pin.getDict(), completion: { (json) in
            completion()
        }, error: { (message) in
            print(message)
        }) { (json) in
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
