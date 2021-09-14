//
//  ImageGroup.swift
//  Example
//
//  Created by duarlen on 2021/9/14.
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
