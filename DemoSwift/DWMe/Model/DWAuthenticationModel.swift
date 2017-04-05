//
//  DWAuthenticationModel.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/3.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import HandyJSON
class DWAuthenticationModel: HandyJSON {
    var APIDATA:[DYauthenticationSectionModel]?
     required init(){}
}

class DYauthenticationSectionModel: HandyJSON {
    var name:String!=""
    var data:[DYauthenticationobj]?
    required init(){}
}

class DYauthenticationobj: HandyJSON {
    var PID:String!=""
    var name:String!=""
    var dec:String!=""
    var category:String!=""
    var status:Int?
    var field_definition:String!=""
    required init(){}
}

