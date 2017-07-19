
//
//  AppDelegate.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UINavigationBar.appearance().barTintColor = UIColor.ECRedColor()
        UINavigationBar.appearance().isTranslucent = false
        
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        return true
    }

}

