//
//  TargetLogin.swift
//  Example
//
//  Created by 杜林顺 on 2021/9/13.
//

import UIKit

class TargetLogin: NSObject, TargetInterface {
    
    static var host = "login"
    
    static var instance: NSObject = TargetLogin()
    
    @objc func login(_ param: [String: Any]) {
        print(" 登录成功")
    }
}
