//
//  ViewController.swift
//  Example
//
//  Created by duarlen on 2021/9/13.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    var item = AItem(selected: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let a = LoginTarget.provider()
        _ = a.rx.request(.login)
            .mapEmptyDataModel()
            .subscribe { _ in
                print("成功")
            } onError: { error in
                print(error.networkError.localizedDescription)
            }
        
    }

}


struct AItem {
    var selected: Bool
}
