//
//  AppDelegate.swift
//  BTL
//
//  Created by Bảo Toàn on 01/03/2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
//        let navi = UINavigationController(rootViewController: trangChuViewController())
        let navi = UINavigationController(rootViewController: TabBarViewController())
        
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
        
        
    }

}

