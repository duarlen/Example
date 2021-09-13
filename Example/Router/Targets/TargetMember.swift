//
//  TargetMember.swift
//  Example
//
//  Created by 杜林顺 on 2021/9/13.
//

import UIKit

class TargetMember: NSObject, TargetInterface {
    
    static let host = "member"
    static let instance: NSObject = TargetMember()
    
    
    @objc func join(_ param: [String: Any]) {
        print(" 加入会员")
    }
}
