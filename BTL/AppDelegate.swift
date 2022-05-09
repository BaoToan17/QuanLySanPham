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
    
    static var historyData: [SanPham] = []
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navi = UINavigationController(rootViewController: TabBarViewController())
        UINavigationBar.appearance().tintColor = .orange
        UINavigationBar.appearance().barTintColor = .white
        navi.navigationBar.shadowImage = UIImage()
        
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
        
        
    }

}

