//
//  AppDelegate.swift
//  TakaoQuiz
//
//  Created by TakaoAtsushi on 2017/11/15.
//  Copyright © 2017年 TakaoAtsushi. All rights reserved.
//

import UIKit
import NCMB
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Configure NCMB
        NCMB.setApplicationKey(NCMBKey.applicationKey, clientKey: NCMBKey.clientKey)
        
        // Push Notification
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if granted {
                DispatchQueue.main.async(execute: {
                    application.registerForRemoteNotifications()
                })
            }
        })
        
        
        let blackColor = UIColor(red: 24.0/255.0, green: 24.0/255.0, blue: 24.0/255.0, alpha:1)
        let whiteColor = UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1)
        
        // ① ナビゲーションバーの背景色
        UINavigationBar.appearance().barTintColor = whiteColor
        
        // ② ナビゲーションバーのタイトルの色
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: blackColor]
        
        // ③ ナビゲーションバー上のアイテムの色
        UINavigationBar.appearance().tintColor = blackColor
        
        //self.navigationController?.navigationBar.titleTextAttributes
        //   = [NSFontAttributeName: UIFont(name: "CFBillabong-Regular", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Billabong", size: 35)!]
        // Override point for customization after application launch.
                
        return true
    }
    
    // Register DeviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let currentInstallation = NCMBInstallation.current()
        currentInstallation?.setDeviceTokenFrom(deviceToken)
        currentInstallation?.saveInBackground({ (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Succeeded to register Device Token")
            }
        })
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
    // 以下略



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

