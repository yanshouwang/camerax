//
//  PreviewViewFactory.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/9.
//

import Flutter
import UIKit

public class ViewFactory: NSObject, FlutterPlatformViewFactory {
    unowned let instanceManager: CameraXApiPigeonInstanceManager
    
    init(instanceManager: CameraXApiPigeonInstanceManager) {
        self.instanceManager = instanceManager
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> any FlutterPlatformView {
        let identifier = args is Int64 ? args as! Int64 : Int64(args as! Int32)
        let instance = instanceManager.instance(forIdentifier: identifier) as AnyObject?
        if let impl = instance as? PlatformViewImpl {
            impl.view().frame = frame
            return impl
        } else {
            let uiView = instance as! UIView
            uiView.frame = frame
            return PlatformViewImpl(uiView: uiView)
        }
    }
    
    public func createArgsCodec() -> any FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    class PlatformViewImpl: NSObject, FlutterPlatformView {
        let uiView: UIView
        
        init(uiView: UIView) {
            self.uiView = uiView
        }
        
        func view() -> UIView {
            return uiView
        }
    }
}
