
//
//  DWTabBarViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/11.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

class DWTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加子控制器
        addChildViewController()
    }
    
    fileprivate  func addChildViewController() {
        let storyHome = UIStoryboard(name:"HomePage",bundle:nil)
        let navHome = storyHome.instantiateInitialViewController() as!UINavigationController
        navHome.tabBarItem = UITabBarItem(title:"首页", image:UIImage(named: "btn_home_select"), selectedImage: nil)
        addChildViewController(navHome)
        
        let storyMe  = UIStoryboard(name:"Me", bundle:nil)
        let navMe = storyMe.instantiateInitialViewController() as!DWNavViewController
        navMe.tabBarItem = UITabBarItem(title: "我", image: UIImage(named:""), selectedImage: nil)
        addChildViewController(navMe)

    }


}
