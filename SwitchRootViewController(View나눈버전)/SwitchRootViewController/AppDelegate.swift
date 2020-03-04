//
//  AppDelegate.swift
//  CheersCalory
//
//  Created by MyMac on 2020/03/02.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // setRootViewController.swift
        setRootView(window: window!)
        return true
    }
}

