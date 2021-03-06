//
//  AppDelegate.swift
//  Find_Cafe
//
//  Created by Sean on 2016/12/28.
//  Copyright © 2016年 Chien Hsiang Yin. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        net?.listener = {status in
            
            if  net?.isReachable ?? false {
                
                if ((net?.isReachableOnEthernetOrWiFi) != nil) {
                    print("Wifi Mode")
                }else if(net?.isReachableOnWWAN)! {
                    print("WAN Mode")
                }
            }
            else {
                let topWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
                topWindow.rootViewController = UIViewController()
                topWindow.windowLevel = UIWindowLevelAlert + 1
                
                let alert = UIAlertController(title: "無網路服務", message: "請檢查網路狀態", preferredStyle: .alert)
                let doAction = UIAlertAction(title: "確定", style: .default, handler: { (action: UIAlertAction) -> Void in
                    topWindow.isHidden = true
                })

                topWindow.makeKeyAndVisible()
                alert.addAction(doAction)
                topWindow.rootViewController?.present(alert, animated: true, completion: nil)
                print("No network")
            }
        }
        // Override point for customization after application launch.
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

