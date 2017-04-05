//
//  DWLoginModel.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/2.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import HandyJSON
/**
 `phone` '手机号码',
 `nickname` 昵称',
 `password`  '密码',
 `paypasswd` '支付密码',
 `mask_salt` '掩码',
 `real_name` '实名',
 `gender`'1男2女',
 `id_card` '身份证号',
 `email` '邮箱',
 `avatar` '头像地址',
 `reg_time` '注册时间',
 `status` '1正常 -1 禁用 -2关闭',
 */
class DWLoginModel: HandyJSON{
    var age:String!=""
    var avatar:String!=""
    var education:String!=""
    var email:String!=""
    var gender:String!=""
    var id:String!=""
    var id_card:String!=""
    var imToken:String!=""
    var location:String!=""
    var nickname:String!=""
    var phone:String!=""
    var real_name:String?
    var reg_time:String!=""
    var status:String!=""
    var area:String!=""
    var verifycode:String!=""//验证码
    var is_baseinfo:String!=""
    var credit_score:String!=""
    var msg:String!=""
    required init() {}
    
}


//MARK:保存
func savModelAchive(loginModel:DWLoginModel){
    let documentPath:URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    NSKeyedArchiver.archiveRootObject(loginModel.toJSON()!, toFile: documentPath.path)
}

//MARK:取出
func getModelAchive()->DWLoginModel {
    var loginModel = DWLoginModel()
    let documentPath:URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    if NSKeyedUnarchiver.unarchiveObject(withFile:documentPath.path) != nil {
        let jsonString = NSKeyedUnarchiver.unarchiveObject(withFile:documentPath.path)
        if let cat = JSONDeserializer<DWLoginModel>.deserializeFrom(dict: jsonString as! NSDictionary?){
            loginModel = cat
        }
    }
    return loginModel
}

//MARK:删除
func deleLoginMessage(){
    let documentPath:URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
   let manager = FileManager.default
   try! manager.removeItem(atPath: documentPath.path)
}

