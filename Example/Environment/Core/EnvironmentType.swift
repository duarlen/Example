//
//  EnvironmentType.swift
//  SHEnvironment
//
//  Created by duarlen on 2021/9/13.
//

import UIKit

enum EnvironmentType: Int, CaseIterable {
    case development = 0
    case release     = 1
    case production  = 2
}

extension EnvironmentType {
    
    var name: String {
        switch self {
        case .development:
            return "开发环境"
        case .release:
            return "测试环境"
        case .production:
            return "线上环境"
        }
    }
    
    var instance: EnvironmentInterface {
        switch self {
        case .development:
            return Development()
        case .release:
            return Release()
        case .production:
            return Production()
        }
    }
}
