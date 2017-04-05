//
//  DWMeViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

private let cellID = "DWMeTableViewCell"
class DWMeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tab: UITableView!
    @IBOutlet weak var scrllViewA: UIScrollView!
    @IBOutlet weak var dashboardBackView: UIView!
    @IBOutlet weak var scollviewContentOffsetYLayout: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tab.delegate = self
        self.tab.dataSource = self
        self.tab.isScrollEnabled = false
        self.scollviewContentOffsetYLayout.constant = 150+410*2
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavtintColor(nav: navigationController!, ColorModel:.DWBlueModel)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DWMeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DWMeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 410
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let Y = scrollView.contentOffset.y
        if scrollView == scrllViewA {
            if Y <= 0 {
                var newFrame = self.dashboardBackView.frame
                newFrame.origin.y = Y
                self.dashboardBackView.frame = newFrame
                
                newFrame = self.tab.frame
                newFrame.origin.y = Y+150;
                self.tab.frame = newFrame
                self.tab.contentOffset = CGPoint(x:0,y:Y)
             //   if (self.tab.pullToRefreshView != nil) {
                    self.tab.addPullToRefreshWithAction {
                        
                    }
              //  }
            }

        }
//        if scrollView.contentOffset.y <= 0 {
//            var newFrame = self.dashboardBackView.frame
//            newFrame.origin.y = Y
//            self.dashboardBackView.frame = newFrame
//            
//            newFrame = self.tab.frame
//            newFrame.origin.y = Y+150;
//            self.tab.frame = newFrame
//           // self.tab.setContentOffset(<#T##contentOffset: CGPoint##CGPoint#>, animated: <#T##Bool#>)
//            //self.tab.setScrollViewContentOffSet(point: CGPoint(x: 0, y: Y))
//            debugPrint(newFrame.origin.y)
//        }else{
//        
//            var newFrame = self.dashboardBackView.frame
//            newFrame.origin.y = Y/2
//            self.dashboardBackView.frame = newFrame
//             debugPrint(Y)
////            newFrame = self.tab.frame
////            newFrame.origin.y = Y+150;
////            self.tab.frame = newFrame
//        }
    }
    @IBAction func loginClick(_ sender: AnyObject) {
        let storySet = UIStoryboard(name:"Setting",bundle:nil)
        let setVC = storySet.instantiateViewController(withIdentifier: "gotoDWSettingViewController") as! DWSettingViewController
        self.navigationController?.pushViewController(setVC, animated: true)
        
        /*
        let storyLogin = UIStoryboard(name:"Login",bundle:nil)
        let logVC = storyLogin.instantiateViewController(withIdentifier: "DYLoginViewController")as! DYLoginViewController
        self.present(logVC, animated: true, completion: nil)
       // self.navigationController?.pushViewController(logVC, animated: true)
 
 */
    }
    //MARK:认证
    @IBAction func authenticationClick(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoDWAuthenticationViewController", sender: self)
    }
    
  

}
