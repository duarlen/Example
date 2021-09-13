//
//  ShareInterface.swift
//  SHShare
//
//  Created by duarlen on 2021/9/9.
//

import UIKit

protocol ShareInterface {
    
    static var shared: ShareInterface { get }
    
    var platform: SharePlatform { get }
    
    func register()
    
    func shareText(object: ShareTextObject, completion: (() -> ()))
    
    func shareImage(object: ShareImageObject, completion: (() -> ()))
    
    func handleOpenUrl(_ url: URL) -> Bool
}
