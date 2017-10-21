//
//  Extensions.swift
//  BishkekCourses
//
//  Created by Zyfar Bektasheov on 3/1/17.
//  Copyright © 2017 ITClinic. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func alert(message: String, title: String = "", _ ok: @escaping ()-> Void, cancel: @escaping ()-> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            ok()
        })
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
            cancel()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
