//
//  ImageGroup.swift
//  Example
//
//  Created by 杜林顺 on 2021/9/14.
//

import UIKit
import Photos

public struct ImageGroup {
    let collection: PHAssetCollection
    let items: [ImageItem]
}

public struct ImageItem {
    let asset: PHAsset
    var isSelected: Bool = false
}
