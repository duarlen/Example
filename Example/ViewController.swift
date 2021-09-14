//
//  ViewController.swift
//  Example
//
//  Created by duarlen on 2021/9/13.
//

import UIKit

class ViewController: UIViewController {

    var item = AItem(selected: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let bb = ImagePickerHelper.fetchGroup(.image)
        print(bb.last?.collection.localizedTitle)
        print(bb.last?.items.count)
        
        
        
        return
        let a = ["a", "b", "c"]
        let b = ["a", "d", "e"]
        let c = ["e", "f", "g"]
        let d = [a, b, c]
        let e = d.reduce([], +)
        
        var f: [String] = []
        for i in e where !f.contains(i) {
            f.append(i)
        }
        
        print(f)
    }

}


struct AItem {
    var selected: Bool
}
