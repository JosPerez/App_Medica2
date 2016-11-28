//
//  AppDelegate.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
        FIRApp.configure()
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        let action = UNNotificationAction(identifier: "tomar", title: "Tomar medicina", options: [.foreground])
        let action3 = UNNotificationAction(identifier: "recordar", title: "Recordar", options: [.foreground])
        let action2 = UNNotificationAction(identifier: "no-tomar", title:"No tomar medicina",options: [.destructive,.foreground])
        let category = UNNotificationCategory(identifier: "myCategory", actions: [action,action3,action2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController:UIViewController
        if FIRAuth.auth()?.currentUser?.uid == nil {
             initialViewController = storyboard.instantiateViewController(withIdentifier: "sign")
        }else {
             initialViewController = storyboard.instantiateViewController(withIdentifier: "log")
        }
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        let center  = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            (granted, error) in
          print (error)
        })
        UNUserNotificationCenter.current().delegate = self
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

