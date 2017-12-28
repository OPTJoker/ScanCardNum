//
//  AppDelegate.swift
//  ScanCardNum
//
//  Created by 张祥龙 on 2017/12/26.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)        
        let homeV = HomeViewController()
        
        let nav = UINavigationController(rootViewController: homeV)
        nav.navigationBar.tintColor = .white        
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.barTintColor = KTopicTintColor
        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                 NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 21)]
        nav.navigationBar.titleTextAttributes = dict as? [NSAttributedStringKey : Any]
        
        self.window!.rootViewController = nav
        self.window!.makeKeyAndVisible()
        // Override point for customization after application launch.

        // TODO:
//        let str = "0123456789"
//        var idx = str.index(after: str.startIndex)
//        idx = str.index(str.startIndex, offsetBy: 2)
//        let subs1 = str[idx...]
//        let subs2 = str[...idx]
//        DLog(msg: "\n\(subs1)\n\(subs2)")
        
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

