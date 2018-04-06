//
//  AppDelegate.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.bool(forKey: "wasLaunched") {
            let storyboard = UIStoryboard.init(name: "MainPage", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            let navigationController = UINavigationController(rootViewController: vc)
            self.window?.rootViewController = navigationController
        }
        
        IQKeyboardManager.sharedManager().enable = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.init(netHex: 0x578C88)]
         UINavigationBar.appearance().tintColor = UIColor.init(netHex: 0x578C88)
        //UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -999999), for:UIBarMetrics.default)
//        UINavigationBar.appearance().barTintColor = UIColor.init(netHex: 0x578C88)
//          UIApplication.shared.statusBarStyle = .lightContent
//        UINavigationBar.appearance().clipsToBounds = true
//        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//        statusBar.backgroundColor = UIColor.init(netHex: 0xE0E0E0)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

