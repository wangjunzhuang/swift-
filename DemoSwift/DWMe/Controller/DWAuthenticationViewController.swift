//
//  DWAuthenticationViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/3.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit
import SwiftyJSON
import Refresher
private let cellID: String = "DWAuthenticationTableViewCell"
class DWAuthenticationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArray = Array<DYauthenticationobj>()
    var sectionArr = Array<DYauthenticationSectionModel>()
    var aucModel:DWAuthenticationModel!
    @IBOutlet weak var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tab.delegate = self
        self.tab.dataSource = self
        weak var weakSelf = self
        let pacmanAnimator = PacmanAnimator(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        showProgressHUD(message: "加载中...");
        requsetDataBase()
        weakSelf?.tab.addPullToRefreshWithAction({
            weakSelf?.requsetDataBase()
        }, withAnimator: pacmanAnimator)
    }
    
    
    //MARK:获取数据
    private func requsetDataBase(){
        weak var weakSelf = self
        getApproveConfigRequst(success: { (authenMoodel, Bool) in
            weakSelf!.aucModel = authenMoodel
            weakSelf!.sectionArr = self.aucModel.APIDATA!
            weakSelf!.tab.reloadData()
            weakSelf!.tab.stopPullToRefresh()
            dismissProgressHUD()
        }) { (Error) in
            weakSelf!.tab.stopPullToRefresh()
            showErrorProgressHUD(message: Error.localizedDescription)
        }
    }
    
    //MARK:Abount_tableView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headView = DWAuthenticationHeadView()
        headView.titleLabel.text = self.aucModel?.APIDATA?[section].name
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 28
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          self.dataArray = self.sectionArr[section].data!
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DWAuthenticationTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DWAuthenticationTableViewCell
        self.dataArray = self.sectionArr[indexPath.section].data!
        cell.models = self.dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}


