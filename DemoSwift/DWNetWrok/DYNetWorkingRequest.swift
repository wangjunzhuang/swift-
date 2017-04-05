//
//  DYNetWorkingRequest.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/2.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
class DYNetWorkingRequest: NSObject {

}
//MARK:登录
/**
 登录
 - parameter params:   参数
 - parameter success:  成功返回
 - parameter failture: 失败返回
 */

func LoginRequst(params : [String : Any], success:@escaping (_ log:DWLoginModel,_ ifComplieted:Bool)->Void, failture :@escaping (_ error : Error)->()){
    
    let af = NetworkRequest()
    af.postRequest(urlString: "login/login", params: params, success: { (dic: [String : AnyObject]) in
        let jsonString = JSON(dic["APIDATA"])
     
        let representation = jsonString.rawString([.castNilToNSNull: true])
        if let loginModel = DWLoginModel.deserialize(from: representation){
            savModelAchive(loginModel: loginModel)
            let issuccess = dic["APISTATUS"] as! Int == 200 ? true : false
            if issuccess == false {
                showErrorProgressHUD(message: dic["APIDES"] as! String)
            }
            success(loginModel,issuccess)
        }
    }) { (Error) in
        failture(Error)
    }
}


 func getApproveConfigRequst(success:@escaping (_ log:DWAuthenticationModel,_ ifComplieted:Bool)->Void, failture :@escaping (_ error : Error)->()){
    let af = NetworkRequest()
    let loginmodel:DWLoginModel = getModelAchive();
    let params = ["user_id":loginmodel.id];
    
    af.postRequest(urlString:"definition/getApproveConfig", params: params, success: { (dic: [String : AnyObject]) in
        let jsonString = JSON(dic)
       // let name = jsonString[0,"data",0,"name"]
        let issuccess = dic["APISTATUS"] as! Int == 200 ? true : false
        if issuccess == false {
            showErrorProgressHUD(message: dic["APIDES"] as! String)
        }

        let representation = jsonString.rawString([.castNilToNSNull: true])
        if let composition = JSONDeserializer<DWAuthenticationModel>.deserializeFrom(json: representation) {
            print(composition.APIDATA?[0].name)
            success(composition ,issuccess)
        }
        
        
    }) { (Error) in
        failture(Error)
    }

}







