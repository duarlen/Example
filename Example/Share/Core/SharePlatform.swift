//
//  SharePlatform.swift
//  SHShare
//
//  Created by duarlen on 2021/9/9.
//

import UIKit

enum SharePlatform: Int, CaseIterable {
    case WeChat = 0
    case QQ     = 1
}

extension SharePlatform {
    
    var instance: ShareInterface {
        switch self {
        case .WeChat:
            return WeChatShare.shared
        case .QQ:
            return QQShare.shared
        }
    }
}
