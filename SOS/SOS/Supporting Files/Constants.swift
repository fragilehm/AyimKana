//
//  Constants.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

//
//  Constans.swift
//  SOS
//
//  Created by ITLabAdmin on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

struct Constants {
    
    static var lang: String?
    
    static var shared: Constants {
        struct Static {
            static let instance = Constants()
        }
        return Static.instance
    }
    
    func setLanguage() {
        Constants.lang = DataManager.shared.getLanguage()
        Network.ErrorMessage.init()
        StartingPage.init()
        Registration.init()
       // MainPage.init()
    }
    
    
    struct Network {
        
        struct ErrorMessage {
            static var NO_INTERNET_CONNECTION = "no_internet_connection".localized(lang: "ru")
            static var UNABLE_LOAD_DATA = "unable_load_data".localized(lang: "ru")
            static let NO_HTTP_STATUS_CODE = "Unable to get response HTTP status code"
            static var UNAUTHORIZED = "unauthorized".localized(lang: "ru")
            
            init() {
                Network.ErrorMessage.NO_INTERNET_CONNECTION = "no_internet_connection".localized(lang: lang!)
                Network.ErrorMessage.UNABLE_LOAD_DATA = "unable_load_data".localized(lang: lang!)
                Network.ErrorMessage.UNAUTHORIZED = "unauthorized".localized(lang: lang!)
            }
        }
        
        struct EndPoints {
            static let Token_auth = "api/token-auth"
            static let Login = "api/user/login"
            static let UpdateUser = "api/user"
            static let SignUp = "api/user/signup"
            static let FinOffice = "api/fin-office"
            static let NewRossahar = "api/news/rossahar?limit=50&offset=0"
            static let LocalNews = "api/news/domestic?limit=50&offset=0"
            static let Expenses = "api/expenses"
            static let SugarJom = "api/sugar-jom"
            static let Currencies = "api/currency"
            static let Weather = "api/weather"
            static let GetUser = "api/user"
            static let GetFields = "api/field"
            static let GetServices = "api/service"
            static let GetTechnologies = "api/technology"
            static let GetSuppliers = "api/supplier"
            static let FieldExpenses = "api/expenses"
            static let BeetPoint = "api/beet-point"
            static let ChangePassword = "api/user/change-password"
            static let RegisterToken = "api/user/register-token"
            
        }
    }
    
    
    struct StartingPage {
        static var directory = [String]()
        static var wheretogo = [String]()
        static var map = [String]()
        static var sms = [String]()
        static var nosilence = [String]()
        init ()
        {
            StartingPage.directory = ["directory".localized(lang: lang!)!,"about_description1".localized(lang: lang!)!]
            StartingPage.wheretogo = ["wheretogo".localized(lang: lang!)!, "about_description2".localized(lang: lang!)!]
            StartingPage.map = ["map".localized(lang: lang!)!, "about_description3".localized(lang: lang!)!]
            StartingPage.sms = ["sms".localized(lang: lang!)!, "about_description4".localized(lang: lang!)!]
            StartingPage.nosilence = ["nosilence".localized(lang: lang!)!, "about_description5".localized(lang: lang!)!]
        }
    }
    
    struct Registration {
        static var save: String?
        
        init() {
            Registration.save = "save".localized(lang: lang!)
        }
    }
    
//    struct MainPage {
//        static var mainmenu: String?
//
//        static var names: [String] {
//
//            let lang = DataManager.shared.getLanguage()
//             MainPage.mainmenu = "mainmenu".localized(lang: lang)
//            return = ["first_cell".localized(lang: lang)!,
//                              "second_cell".localized(lang: lang)!,
//                              "third_cell".localized(lang: lang)!,
//                              "fourth_cell".localized(lang: lang)!,
//                              "fifth_cell".localized(lang: lang)!,
//                              "sixth_cell".localized(lang: lang)!]
//        }
//        init() {}
//    }

}


struct Translation {
    
    static var mainMenu: String {
        let lang = DataManager.shared.getLanguage()
        return "mainmenu".localized(lang: lang)!
    }
    
    static var menuNames: [String] {
        let lang: String = DataManager.shared.getLanguage()
        return  ["first_cell".localized(lang: lang)!,
        "second_cell".localized(lang: lang)!,
        "third_cell".localized(lang: lang)!,
        "fourth_cell".localized(lang: lang)!,
        "fifth_cell".localized(lang: lang)!,
        "sixth_cell".localized(lang: lang)!]
    }
    
    
}


