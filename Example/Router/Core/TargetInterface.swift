//
//  TargetInterface.swift
//  TRouter
//
//  Created by 杜林顺 on 2021/7/14.
//

import UIKit

@objc protocol TargetInterface: NSObjectProtocol {
    
    /// 模块名
    static var host: String { get }
    
    /// 实例对象
    static var instance: NSObject { get }
}
