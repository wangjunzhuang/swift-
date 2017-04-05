//
//  DWAuthenticationTableViewCell.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/3.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import SwiftyJSON
class DWAuthenticationTableViewCell: UITableViewCell {
 //   var model:JSON = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    var models:DYauthenticationobj! {
        didSet{
            self.titleLabel.text = self.models.name
            self.typeLabel.text  = self.models.dec
            if self.models.status == 1 {
                iconImage.image = UIImage(named:"me_strar_sel_image")
            }else{
                 iconImage.image = UIImage(named:"me_strar_nol_image")
            }
        }

    }
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  

}

//var models:DYauthenticationobj!{
//
//}
