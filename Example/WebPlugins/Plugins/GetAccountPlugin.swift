//
//  GetAccountPlugin.swift
//  Example
//
//  Created by duarlen on 2021/9/14.
//

import UIKit
import WebKit

class GetAccountPlugin: WebPluginInterface {
    
    let name = "GetAccount"
    
    func didReceive(_ webView: WKWebView, message: WKScriptMessage) {
        print(" 收到获取账户的通知")
        webView.evaluateJavaScript("", completionHandler: nil);
    }
}
