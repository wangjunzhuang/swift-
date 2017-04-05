//
//  DYLoginViewController.swift
//  DemoSwift
//
//  Created by XiaMenDiyou on 17/3/2.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

import UIKit

class DYLoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        activity.isHidden = true
   
        // Do any additional setup after loading the view.
    }
    
    //MARK:登录
    @IBAction func loginClick(_ sender: UIButton) {
        
        guard let username = self.usernameTextField.text, !username.isEmpty else{
            print(self.usernameTextField.text)
            showErrorProgressHUD(message: "请输入账号！")
            return
        }
        
        guard (self.usernameTextField.text?.characters.count)!<=11 else {
            showErrorProgressHUD(message: "请输入正确的账号！(不小于11位)")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            showErrorProgressHUD(message: "请输入密码！")
            return
        }
        print((self.passwordTextField.text?.characters.count)!)
        guard (self.passwordTextField.text?.characters.count)!>6 else {
            showErrorProgressHUD(message: "请输入正确的密码！(不小于6位)")
            return
        }
        let usernameStr = self.usernameTextField.text! as String
        let pwdStr = self.passwordTextField.text! as String
        let arr = ["phone":usernameStr ,
                   "password":pwdStr,
                   "imei":"123"]
        //loginBtn.state =
        loginBtn.isEnabled = false
        loginBtn .setTitle("登录中...", for: .disabled)
        activity.startAnimating()
        self.activity.isHidden = false
        LoginRequst(params: arr, success: { (DWLoginModel, isSuccess) in
            self.loginBtn.isEnabled = true
            self.activity.stopAnimating()
            self.activity.isHidden = true
            guard isSuccess == false else{
                self .dismiss(animated: true, completion: nil)
                return
            }
            
            }) { (Error) in
                self.loginBtn.isEnabled = true
                self.activity.stopAnimating()
                self.activity.isHidden = true
                showErrorProgressHUD(message: Error.localizedDescription)
            }
            
        }
    
    //MARK:注册
    @IBAction func registerClick(_ sender: UIButton) {
        guard let passwordText = self.passwordTextField.text, !passwordText.isEmpty else {
           // self.showAlert(_message: "请输入密码")
            return
        }
        
    }
    //MARK:忘记密码
    @IBAction func forgetPassword(_ sender: UIButton) {
    }
    

}
