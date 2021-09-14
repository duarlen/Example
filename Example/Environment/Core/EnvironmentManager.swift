//
//  EnvironmentManager.swift
//  SHEnvironment
//
//  Created by duarlen on 2021/9/13.
//

import UIKit

class EnvironmentManager {

    static var instance: EnvironmentInterface { return EnvironmentManager.environmentType.instance }
    
    private(set) static var environmentType = EnvironmentManager.getEnvironmentType()
    
    static func update(_ environmentType: EnvironmentType) {
        #if DEBUG
        if environmentType == self.environmentType  { return }
        EnvironmentManager.setEnvironmentType(environmentType)
        self.environmentType = environmentType;
        #endif
    }
    
    static func show(_ completion: (() ->())?) {
        #if DEBUG
        func buildAlertAction(_ type: EnvironmentType) -> UIAlertAction {
            return UIAlertAction(title: type.name, style: .default) { _ in
                self.update(type)
                completion?()
            }
        }
        let alertController = UIAlertController(title: nil, message: "请选择项目环境", preferredStyle: .actionSheet)
        EnvironmentType.allCases.map{ buildAlertAction($0) }.forEach { alertController.addAction($0) }
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true, completion: nil)
        #endif
    }
}


private extension EnvironmentManager {

    static func getEnvironmentType() -> EnvironmentType {
        #if DEBUG
        let value = UserDefaults.standard.integer(forKey: "EnvironmentType")
        return EnvironmentType(rawValue: value) ?? .development
        #else
        return EnvironmentType.production
        #endif
    }
    
    static func setEnvironmentType(_ type: EnvironmentType) {
        #if DEBUG
        UserDefaults.standard.set(type.rawValue, forKey: "EnvironmentType")
        #endif
    }
}
