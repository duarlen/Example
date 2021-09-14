//
//  WebPluginManager.swift
//  Example
//
//  Created by duarlen on 2021/9/14.
//

import UIKit
import WebKit

public class WebPluginManager: NSObject {
    
    public let plugins = WebPluginManager.allPlugins()
    public let webView: WKWebView
    
    public init(webView: WKWebView) {
        self.webView = webView
    }
}

extension WebPluginManager {
    
    /// 所有的插件
    private static func allPlugins() -> [WebPluginInterface] {
        return [GetAccountPlugin()]
    }
    
    /// 添加插件
    public func insertPlugins(_ userContentController: WKUserContentController) {
        for plugin in plugins {
            plugin.userScripts.forEach{ userContentController.addUserScript($0) }
            userContentController.add(self, name: plugin.name)
        }
    }
    
    /// 移除插件
    public func removePlugins(_ userContentController: WKUserContentController) {
        userContentController.removeAllUserScripts()
        userContentController.removeAllScriptMessageHandlers()
    }
}

extension WebPluginManager: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard webView.configuration.userContentController != userContentController else { return }
        guard let plugin = plugins.first(where: {$0.name == message.name}) else { return }
        plugin.didReceive(webView, message: message)
    }
}
