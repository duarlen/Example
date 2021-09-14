//
//  ImagePickerHelper.swift
//  Example
//
//  Created by 杜林顺 on 2021/9/14.
//

import UIKit
import Photos

public class ImagePickerHelper {
    
    /// 获取全部的分组
    public static func fetchGroup(_ pickerType: ImagePickerType) -> [ImageGroup] {
        let options = ImagePickerHelper.buildFetchOptions(pickerType)
        return ImagePickerHelper.fetchAssetCollection(options).map{ buildGroup($0, options) }
    }
    
    /// 不分组，获取全部的资源
    public static func fetchItem(_ pickerType: ImagePickerType) -> [ImageItem] {
        let options = ImagePickerHelper.buildFetchOptions(pickerType)
        return fetchAllAssets(options).map{ buildItem($0)}
    }
}

private extension ImagePickerHelper {
    
    static func buildFetchOptions(_ pickerType: ImagePickerType) -> PHFetchOptions {
        let option = PHFetchOptions()
        option.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        switch pickerType {
            case .all:
                break
            case .image:
                option.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
            case .video:
                option.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.video.rawValue)
        }
        return option
    }
    
    static func buildGroup(_ collection: PHAssetCollection, _ options: PHFetchOptions) -> ImageGroup {
        let assets  = fetchAsset(collection, options: options)
        let items   = assets.map{ buildItem($0) }
        return ImageGroup(collection: collection, items: items)
    }
    
    static func buildItem(_ asset: PHAsset) -> ImageItem {
        return ImageItem(asset: asset)
    }
    
    static func fetchAssetCollection(_ options: PHFetchOptions) -> [PHAssetCollection] {
        var group: [PHAssetCollection] = []
        func collectAlbum<T:AnyObject>(album: PHFetchResult<T>, options: PHFetchOptions) {
            for i in 0 ..< album.count {
                guard let collection = album[i] as? PHAssetCollection else { continue }
                let result = PHAsset.fetchAssets(in: collection, options: options)
                if result.count > 0  {
                    if collection.assetCollectionSubtype == .smartAlbumUserLibrary {
                        group.insert(collection, at: 0)
                    } else {
                        group.append(collection)
                    }
                }
            }
        }
        
        let smartAlbums     = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
        let userAlbums      = PHAssetCollection.fetchTopLevelUserCollections(with: nil)
        let syncedAlbums    = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumSyncedAlbum, options: nil)
        
        collectAlbum(album: smartAlbums,    options: options)
        collectAlbum(album: userAlbums,     options: options)
        collectAlbum(album: syncedAlbums,   options: options)
        
        return group;
    }
    
    static func fetchAsset(_ collection: PHAssetCollection, options: PHFetchOptions) -> [PHAsset] {
        let result = PHAsset.fetchAssets(in: collection, options: options)
        var assets: [PHAsset] = []
        for i in 0 ..< result.count {
            assets.append(result[i])
        }
        return assets
    }
    
    static func fetchAllAssets(_ options: PHFetchOptions) -> [PHAsset] {
        let collections = fetchAssetCollection(options)
        let assets = collections.map{ fetchAsset($0, options: options) }.reduce([], +)
        return removeDuplicates(assets)
    }
    
    static func removeDuplicates<T: Equatable>(_ array: [T]) -> [T] {
        var list: [T] = []
        for i in array where !list.contains(i) {
            list.append(i)
        }
        return list
    }
}
