//
//  AppDelegate.swift
//  ServiceMVVMDemo
//
//  Created by Bharat Khatke on 21/08/20.
//  Copyright © 2020 Bharat Khatke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Set Navigation lookup
        let navigationApperance = UINavigationBar.appearance()
        navigationApperance.barTintColor = UIColor.darkGray
        navigationApperance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationApperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        
        
        return true
    }
}

