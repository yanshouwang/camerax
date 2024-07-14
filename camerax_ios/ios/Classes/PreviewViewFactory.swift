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
        guard let view = views[viewId] else {
            let newView = PreviewView()
            views[viewId] = newView
            return newView
        }
        return view
    }
    
    @objc public func retrieveView(_ viewId: Int64) -> PreviewView? {
        return views[viewId]
    }
    
    func removeView(_ view: PreviewView) {
        guard let element = views.first(where: { $0.value == view }) else {
            return
        }
        views.removeValue(forKey: element.key)
    }
}
