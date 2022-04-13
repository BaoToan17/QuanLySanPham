//
//  TabBarViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 27/03/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//    title = "Tuỳ chọn"
        
        self.tabBar.tintColor = .brown
        self.tabBar.barTintColor = .black

        let homeVC = trangChuViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "icon_house"), selectedImage:UIImage(named: "icon_HouseSelected"))
        

        let setting = optionViewController()
        self.viewControllers = [homeVC, setting]
        setting.tabBarItem = UITabBarItem(title: "Tuỳ chọn", image: UIImage(named: "Icon_TC"), selectedImage: UIImage(named: "Icon_TCSelected"))
        

    
    
    }
}
