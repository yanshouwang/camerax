//
//  ImageProxyImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation
import Flutter

class ImageProxyImpl: PigeonApiDelegateImageProxyApi {
    func format(pigeonApi: PigeonApiImageProxyApi, pigeonInstance: ImageProxy) throws -> ImageFormatApi {
        return pigeonInstance.format.api
    }
    
    func width(pigeonApi: PigeonApiImageProxyApi, pigeonInstance: ImageProxy) throws -> Int64 {
        return Int64(pigeonInstance.width)
    }
    
    func height(pigeonApi: PigeonApiImageProxyApi, pigeonInstance: ImageProxy) throws -> Int64 {
        return Int64(pigeonInstance.height)
    }
    
    func planes(pigeonApi: PigeonApiImageProxyApi, pigeonInstance: ImageProxy) throws -> [ImageProxy.PlaneProxy] {
        return pigeonInstance.planes
    }
    
    func imageInfo(pigeonApi: PigeonApiImageProxyApi, pigeonInstance: ImageProxy) throws -> ImageInfo {
        return pigeonInstance.imageInfo
    }
    
    class PlaneProxyImpl: PigeonApiDelegatePlaneProxyApi {
        func buffer(pigeonApi: PigeonApiPlaneProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> FlutterStandardTypedData {
            return FlutterStandardTypedData(bytes: pigeonInstance.data)
        }
        
        func pixelStride(pigeonApi: PigeonApiPlaneProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> Int64 {
            return Int64(pigeonInstance.pixelStride)
        }
        
        func rowStride(pigeonApi: PigeonApiPlaneProxyApi, pigeonInstance: ImageProxy.PlaneProxy) throws -> Int64 {
            return Int64(pigeonInstance.rowStride)
        }
    }
}
