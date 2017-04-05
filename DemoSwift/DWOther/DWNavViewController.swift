//
//  DWNavViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/9.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
public enum DWNavColorModel:Int {
    case DWWhiteModel
    case DWBlueModel
}
class DWNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBarHairlineImageView:UIImageView = findHairlineImageViewUnder(view: self.navigationBar)
        navBarHairlineImageView.isHidden = true
        // Do any additional setup after loading the view.
    }
    override class func initialize() {
 
    }
    lazy var backBtn: UIButton = UIButton(backTarget: self, action: #selector(DWNavViewController.backBtnAction))
    
    func backBtnAction() {
        self.popViewController(animated: true)
        dismissProgressHUD()
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.navigationController?.viewControllers.count == 0 {
            viewController.hidesBottomBarWhenPushed = false
        }else{
            let barbutton = UIBarButtonItem(customView: backBtn)
            viewController.navigationItem.leftBarButtonItems = [barbutton]
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}

//MARK:导航栏颜色
public func setNavtintColor(nav:UINavigationController, ColorModel:DWNavColorModel){
    switch ColorModel {
    case .DWWhiteModel:
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        nav.navigationBar.barTintColor = UIColor(red:1, green:1, blue:1, alpha:1)
        nav.navigationBar.tintColor = UIColor(red:12.0/255.0, green:175.0/255.0, blue:245.0/255.0, alpha:1)
    default:
        nav.navigationBar.barTintColor = UIColor(red:12.0/255.0, green:175.0/255.0, blue:245.0/255.0, alpha:1)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
}

func findHairlineImageViewUnder(view:UIView) -> UIImageView {
    if (view.isKind(of: UIImageView.self)) && view.bounds.size.height <= 1.0 {
        return view as! UIImageView
    }
    
    for imge:UIView  in view.subviews {
        let imageview = findHairlineImageViewUnder(view:imge)
        if imageview .isKind(of: UIImageView.self){
            return imageview
        }
    }
    return view as! UIImageView
}
