//
//  DYCornerRadiusView.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/9.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

class DYCornerRadiusView: UIView {


}

class DYCornerRadiusButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
       self.layer.masksToBounds = true
        self.layer.cornerRadius = 5;
    }
}
