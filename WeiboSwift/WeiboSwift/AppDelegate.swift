//
//  AppDelegate.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/2.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange;
        UIBarButtonItem.appearance().tintColor = UIColor.orange;
        
        return true
    }

}

