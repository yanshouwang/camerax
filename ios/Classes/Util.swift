//
//  Util.swift
//  camerax
//
//  Created by 闫守旺 on 2021/2/6.
//

import AVFoundation
import Flutter
import Foundation

@propertyWrapper
public struct MainThreadClosure<Data> {
    private var closure: ((Data) -> Void)?
    public var wrappedValue: ((_ newData: Data) -> Void)? {
        get {
            return { newData in
                DispatchQueue.main.async {
                    closure?(newData)
                }
            }
        }

        set {
            closure = newValue
        }
    }

    public init(wrappedValue: ((_ newData: Data) -> Void)?) {
        self.closure = wrappedValue
    }
}


extension Error {
    func throwNative(_ result: FlutterResult) {
        let error = FlutterError(code: localizedDescription, message: nil, details: nil)
        result(error)
    }
}

extension AVCaptureDevice {
    var minZoom: CGFloat {
        if #available(iOS 11.0, *) {
            return self.minAvailableVideoZoomFactor
        }
        else {
            return 1.0
        }
    }
    
    var maxZoom: CGFloat {
        if #available(iOS 11.0, *) {
            return self.maxAvailableVideoZoomFactor
        }
        else {
            return 1.0
        }
    }
}
