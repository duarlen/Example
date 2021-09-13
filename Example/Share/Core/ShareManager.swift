//
//  ShareManager.swift
//  SHShare
//
//  Created by duarlen on 2021/9/9.
//

import UIKit

class ShareManager {

    private let interfaces: [ShareInterface] = SharePlatform.allCases.map{ $0.instance }
    static let shared = ShareManager()
    
    func register() {
        
    }
    
    func handleOpenUrl(_ url: URL) -> Bool {
        for interface in interfaces where interface.handleOpenUrl(url) {
            return true
        }
        return false
    }
    
    func shareText(platform: SharePlatform, object: ShareTextObject, completion: (() -> ())) {
        if let interface = interfaces.first(where: { $0.platform == platform }) {
            interface.shareText(object: object, completion: completion)
        }
    }
    
    func shareImage(platform: SharePlatform, object: ShareImageObject, completion: (() -> ())) {
        if let interface = interfaces.first(where: { $0.platform == platform }) {
            interface.shareImage(object: object, completion: completion)
        }
    }
}

