//
//  DWHomepageViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
class DWHomepageViewController: UIViewController {
    @IBOutlet weak var testBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func reqClick(_ sender: UIButton) {
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavtintColor(nav: navigationController!, ColorModel:.DWBlueModel)
    }

}
