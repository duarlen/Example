//
//  QQShare.swift
//  SHShare
//
//  Created by duarlen on 2021/9/9.
//

import UIKit

class QQShare: ShareInterface {
    
    static var shared: ShareInterface = QQShare()
    
    var platform = SharePlatform.QQ
    
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
