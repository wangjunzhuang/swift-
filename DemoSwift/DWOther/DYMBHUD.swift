//
//  DYMBHUD.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/2.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
let kVioLetColor = "colorLiteralRed: 111/255, green: 123/255, blue: 128/255, alpha: 0.8"
class DYMBHUD: NSObject {

}
//MARK:加载
public func showProgressHUD(message:String){
    SVProgressHUD.show(withStatus: message )
    ProgressStyle(message: message)
}

public func ShowsuccessProgressHUD(message:String)  {
    SVProgressHUD.showSuccess(withStatus: message)
    ProgressStyle(message: message)
}

public func showErrorProgressHUD(message:String) {
    SVProgressHUD.showError(withStatus: message)
    ProgressStyle(message: message)
}

public func dismissProgressHUD(){
    SVProgressHUD.dismiss()
}

func ProgressStyle(message:String) {
    let len2 = Float(message.characters.count)
    let displayInterval:TimeInterval = 0.5//TimeInterval(max((len2 * 0.07+0.1), (Float)(1)))
    SVProgressHUD.setBackgroundColor(UIColor.init(colorLiteralRed: 111/255, green: 123/255, blue: 128/255, alpha: 0.8))
    SVProgressHUD.setForegroundColor(UIColor.white)
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue:2)!)
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue:2)!)
    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType(rawValue:1)!)
    SVProgressHUD.setMinimumDismissTimeInterval(displayInterval)
}
