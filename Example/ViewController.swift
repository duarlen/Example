//
//  ViewController.swift
//  Example
//
//  Created by duarlen on 2021/9/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Router.open("navite://login/login")
        _ = Router.open("navite://member/join")
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        EnvironmentManager.shared.show(nil)
        _ = Router.open("navite://login/login")
    }

}

