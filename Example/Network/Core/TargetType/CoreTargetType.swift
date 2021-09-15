//
//  CoreTargetType.swift
//  NetworkCore
//
//  Created by Top on 2021/2/4.
//

import Foundation
import Moya

#warning("可以根据业务需要，添加其他功能")
public protocol CoreTargetType: TargetType {
    
    // 包含的插件
    static var plugins: [PluginType] { get }
    
    // 请求超时时间
    var timeoutInterval: TimeInterval { get }
    
    // 是否能够显示日志
    var isEnableLogger: Bool { get }
    
    var isEnableCache: Bool { get }
}


extension CoreTargetType {
    
    static var plugins: [PluginType] { return [PluginTimeout(), PluginLogger()] }
    
    var timeoutInterval: TimeInterval { return 30 }
    
    var isEnableLogger: Bool { return true }
    
    var isEnableCache: Bool { return false }

    var sampleData: Data { return Data() }
}

public extension CoreTargetType {
    
    #warning("用户根据需要，添加自己需要的插件")
    static func provider() -> MoyaProvider<Self> {
        return MoyaProvider(plugins: plugins)
    }
}
