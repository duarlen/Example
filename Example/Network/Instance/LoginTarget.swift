//
//  LoginTarget.swift
//  Example
//
//  Created by 杜林顺 on 2021/9/15.
//

import UIKit
import Moya

enum LoginTarget {
    case login
    case register
}

extension LoginTarget: CoreTargetType {
    
    var baseURL: URL {
        return URL(string: "https://www.baidu.com")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return Method.get
    }
    
    var task: Task {
        return Task.requestParameters(parameters: [:], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
