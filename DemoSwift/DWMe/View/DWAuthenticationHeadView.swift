//
//  DWAuthenticationHeadView.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/5.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

class DWAuthenticationHeadView: UIView {
   public var titleLabel = UILabel()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel = UILabel(frame:CGRect(x:10,y:2,width:65,height:22))
        self.backgroundColor = UIColor.init(red: 245/255, green: 248/255, blue: 250/255, alpha: 1)
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  
}
