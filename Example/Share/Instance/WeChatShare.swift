//
//  WeChatShare.swift
//  SHShare
//
//  Created by duarlen on 2021/9/9.
//

import UIKit

class WeChatShare: ShareInterface {
        
    static var shared: ShareInterface = WeChatShare()
    
    var platform = SharePlatform.WeChat
    
    func register() {
        
    }
    
    func handleOpenUrl(_ url: URL) -> Bool {
        return false
    }
    
    func shareText(object: ShareTextObject, completion: (() -> ())) {
        
    }
    
    func shareImage(object: ShareImageObject, completion: (() -> ())) {
        
    }
}
