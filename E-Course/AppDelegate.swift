//
//  AppDelegate.swift
//  E-Course
//
//  Created by Suparuch Sriploy on 10/15/14.
//  Copyright (c) 2014 Suparuch Sriploy. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginView: LoginViewController?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.setApplicationId("BcbeKWhYAXHFKfQkjMpOmNG24Gnx6VzgcWoejsyj", clientKey: "X693ZV6uIfDSUPwpnfpGXLTuZNl3CDX1Y3fvOBNM")
        /*
        let tabBarController = UITabBarController()
        let tabNews = NewsViewController(nibName: "News", bundle: nil)
        let tabCourse = CourseViewController(nibName: "Course", bundle: nil)
        let controllers = [tabNews,tabCourse]
        tabBarController.viewControllers = controllers
        window?.rootViewController = tabBarController
        let firstImage = UIImage(named: "pie bar icon")
        let secondImage = UIImage(named: "pizza bar icon")
        tabNews.tabBarItem = UITabBarItem(title: "News", image: firstImage, tag: 1)
        tabCourse.tabBarItem = UITabBarItem(title: "Course", image: secondImage, tag:2)
        
        loginView = LoginViewController(nibName: "NewsViewController", bundle: nil)
        */
        //self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //self.window!.rootViewController = self.loginView
        //self.window!.makeKeyAndVisible()
       
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let tabBarController = UITabBarController()
        let newView = NewsViewController(nibName: "NewsViewController", bundle: nil)
        let courseView = CourseViewController(nibName: "CourseViewController", bundle: nil)
        let mycourseView = MycourseViewController(nibName: "MycourseViewController", bundle: nil)
        let resultView = ResultViewController(nibName: "ResultViewController", bundle: nil)
        let settingView = SettingViewController(nibName: "SettingViewController", bundle: nil)
        let controllers = [newView,courseView,mycourseView,resultView,settingView]
        tabBarController.viewControllers = controllers
        window?.rootViewController = tabBarController
       // let firstImage = UIImage(named: "News")
       // let secondImage = UIImage(named: "pizza bar icon")
        newView.tabBarItem = UITabBarItem(title: "News", image: nil, tag: 1)
        courseView.tabBarItem = UITabBarItem(title: "Course", image: nil, tag:2)
        mycourseView.tabBarItem = UITabBarItem(title: "MyCourse", image: nil, tag:3)
        resultView.tabBarItem = UITabBarItem(title: "Result", image: nil, tag:4)
        settingView.tabBarItem = UITabBarItem(title: "Setting", image: nil, tag:5)
        self.window!.makeKeyAndVisible()
        return true
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

