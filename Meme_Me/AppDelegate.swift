//
//  AppDelegate.swift
//  Meme_Me
//
//  Created by W N Barker on 10/7/16.
//  Copyright © 2016 W N Barker. All rights reserved.
//

import UIKit

struct meme{
    var image:UIImage?
    var topText:String?
    var botText:String?
    var meme:UIImage?
}


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var dict1 = NSMutableDictionary(contentsOfFile: Bundle.main.path(forResource: "Info", ofType: "plist")!)
    
    var memeList:[meme] = []
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //memeList = dict1?.object(forKey: "MemeList") as! [meme]
        
        for (key,value) in dict1!{
            if key as! String == "MemeList" {
                print("\(key)          \(value)")
                memeList = value as! [meme]
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        dict1?.setValue(memeList, forKey: "MemeList")
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        dict1?.setValue(memeList, forKey: "MemeList")

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        dict1?.setValue(memeList, forKey: "MemeList")
        
    }
    
    func saveMemes(){
        dict1?.setValue(memeList, forKey: "MemeList")
    }
    


}

