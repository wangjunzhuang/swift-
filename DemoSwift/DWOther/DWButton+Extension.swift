//
//  DWButton+Extension.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/10.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

extension UIButton {
    /// 导航栏返回按钮
    convenience init(backTarget: AnyObject?, action: Selector) {
        self.init()
        setImage(UIImage(named: "backLeftH"), for: UIControlState())
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
       // backgroundColor = UIColor.red
        addTarget(backTarget, action: action, for: UIControlEvents.touchUpInside)
    }

}
