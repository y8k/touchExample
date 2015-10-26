//
//  AppDelegate.swift
//  touchExample
//
//  Created by KimYoonBong on 2015. 10. 23..
//  Copyright © 2015년 y8k. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let loginStatus = NSUserDefaults.standardUserDefaults().boolForKey("login_status")
        
        self.arrangeDynamicShortCutItem(loginStatus)
        
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        self.handleShortCutItem(shortcutItem)
    }
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) {
        
        guard let rootViewCntrlr = self.window?.rootViewController else {
            return
        }
        
        if rootViewCntrlr.presentedViewController != nil    {
            let viewCntrlr = rootViewCntrlr.presentedViewController
            viewCntrlr?.dismissViewControllerAnimated(false, completion: nil)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let presentNavigation = storyboard.instantiateViewControllerWithIdentifier("PRESENT_NAVIGATION_SCREEN") as? UINavigationController  else  {
            return
        }
        
        guard let viewCntrlr = presentNavigation.topViewController as? PresentedViewController else {
            return
        }
        
        viewCntrlr.shortCutItem = shortcutItem
        
        rootViewCntrlr.presentViewController(presentNavigation, animated: true, completion: nil)
    }
    
    
    func arrangeDynamicShortCutItem(isLogin: Bool)    {
        
        var shortCutItemArray: [UIApplicationShortcutItem] = []
        
        // When user already logged in...
        if isLogin  {
            let firstShortCutIcon = UIApplicationShortcutIcon(templateImageName: "ShortCut01")
            let firstFunctionShortCutItem = UIApplicationShortcutItem(type: "com.y8k.touchExample.function01", localizedTitle: "Member Func. 1", localizedSubtitle: "Dynamic short cut item", icon: firstShortCutIcon, userInfo: nil)
            
            let secondShortCutIcon = UIApplicationShortcutIcon(templateImageName: "ShortCut02")
            let secondFunctionShortCutItem = UIApplicationShortcutItem(type: "com.y8k.touchExample.function02", localizedTitle: "Member Func. 2", localizedSubtitle: "Dynamic short cut item", icon: secondShortCutIcon, userInfo: nil)
            
            shortCutItemArray += [firstFunctionShortCutItem, secondFunctionShortCutItem]
        }
        // When user isn't logged in...
        else    {
            let firstShortCutIcon = UIApplicationShortcutIcon(templateImageName: "ShortCut01")
            let firstFunctionShortCutItem = UIApplicationShortcutItem(type: "com.y8k.touchExample.function01", localizedTitle: "User Func. 1", localizedSubtitle: "Dynamic short cut item", icon: firstShortCutIcon, userInfo: nil)
            
            let secondShortCutIcon = UIApplicationShortcutIcon(templateImageName: "ShortCut02")
            let secondFunctionShortCutItem = UIApplicationShortcutItem(type: "com.y8k.touchExample.function02", localizedTitle: "User Func. 2", localizedSubtitle: "Dynamic short cut item", icon: secondShortCutIcon, userInfo: nil)
            
            shortCutItemArray += [firstFunctionShortCutItem, secondFunctionShortCutItem]
        }
        
        UIApplication.sharedApplication().shortcutItems = shortCutItemArray
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

