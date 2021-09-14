//
//  WebPluginInterface.swift
//  Example
//
//  Created by duarlen on 2021/9/14.
//

import UIKit
import WebKit

public protocol WebPluginInterface {
    
    /// 和JS端协商的名称
    var name: String { get }
    
    /// 注入的脚本。（默认：没有）
    var userScripts: [WKUserScript] { get }
    
    /// 收到 JS 的调用
    func didReceive(_ webView: WKWebView, message: WKScriptMessage)
}

extension WebPluginInterface {
    
    var userScripts: [WKUserScript] {
        return []
    }
}
