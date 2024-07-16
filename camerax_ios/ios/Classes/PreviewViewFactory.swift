//
//  PreviewViewFactory.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/9.
//

import Flutter
import UIKit

@objc public class PreviewViewFactory: NSObject, FlutterPlatformViewFactory {
    @objc public static let shared = PreviewViewFactory()
    
    private var views = [Int64: PreviewView]()
    
    private override init() {}
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> any FlutterPlatformView {
        return PreviewViewImpl(frame: frame, viewId: viewId, args: args)
    }
    
    @objc public func retrieveView(_ viewId: Int64) -> PreviewView? {
        return views[viewId]
    }
    
    class PreviewViewImpl: NSObject, FlutterPlatformView {
        let frame: CGRect
        let viewId: Int64
        let args: Any?
        
        init(frame: CGRect, viewId: Int64, args: Any?) {
            self.frame = frame
            self.viewId = viewId
            self.args = args
        }
        
        func view() -> UIView {
            if let view = PreviewViewFactory.shared.views[viewId] {
                return view
            } else {
                let view = PreviewView(frame: frame)
                PreviewViewFactory.shared.views[viewId] = view
                return view
            }
        }
        
        deinit {
            PreviewViewFactory.shared.views.removeValue(forKey: viewId)
        }
    }
}
