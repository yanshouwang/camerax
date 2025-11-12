//
//  ImageProxyDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation
import Flutter

class ImageProxyDelegate: PigeonApiDelegateImageProxyProxyApi {
    func format(pigeonApi: PigeonApiImageProxyProxyApi, pigeonInstance: ImageProxy) throws -> ImageFormatApi {
        let format = try pigeonInstance.getFormat()
        return format.api
    }
    
    func width(pigeonApi: PigeonApiImageProxyProxyApi, pigeonInstance: ImageProxy) throws -> Int64 {
        let width = try pigeonInstance.getWidth()
        return Int64(width)
    }
    
    func height(pigeonApi: PigeonApiImageProxyProxyApi, pigeonInstance: ImageProxy) throws -> Int64 {
        let height = try pigeonInstance.getHeight()
        return Int64(height)
    }
    
    func planes(pigeonApi: PigeonApiImageProxyProxyApi, pigeonInstance: ImageProxy) throws -> [ImageProxy.PlaneProxy] {
        return try pigeonInstance.getPlanes()
    }
    
    func imageInfo(pigeonApi: PigeonApiImageProxyProxyApi, pigeonInstance: ImageProxy) throws -> ImageInfo {
        return try pigeonInstance.getImageInfo()
    }
    
    class PlaneProxyDelegate: PigeonApiDelegateImageProxyPlaneProxyProxyApi {
        func value(pigeonApi: PigeonApiImageProxyPlaneProxyProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> FlutterStandardTypedData {
            let value = try pigeonInstance.getValue()
            return FlutterStandardTypedData(bytes: value)
        }
        
        func pixelStride(pigeonApi: PigeonApiImageProxyPlaneProxyProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> Int64 {
            let pixelStride = try pigeonInstance.getPixelStride()
            return Int64(pixelStride)
        }
        
        func rowStride(pigeonApi: PigeonApiImageProxyPlaneProxyProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> Int64 {
            let rowStride = try pigeonInstance.getRowStride()
            return Int64(rowStride)
        }
    }
}
