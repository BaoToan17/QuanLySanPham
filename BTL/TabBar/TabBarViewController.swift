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
        
        self.tabBar.tintColor = .orange
        self.tabBar.barTintColor = .white

        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = UIColor.orange
        let homeVC = trangChuViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "icon_house"), selectedImage:UIImage(named: "icon_HouseSelected"))
        

        let setting = optionViewController()
        self.viewControllers = [homeVC, setting]
        setting.tabBarItem = UITabBarItem(title: "Tuỳ chọn", image: UIImage(named: "Icon_TC"), selectedImage: UIImage(named: "Icon_TCSelected"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
