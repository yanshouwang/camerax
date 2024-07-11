//
//  PreviewView.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/9.
//

import AVFoundation
import Flutter

@objc public class PreviewView: UIView, FlutterPlatformView {
    // Use a capture video preview layer as the view's backing layer.
    public override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    private var previewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }
    
    // Connect the layer to a capture session.
    @objc public var session: AVCaptureSession? {
        get { previewLayer.session }
        set { previewLayer.session = newValue }
    }
    
    @objc public var videoGravity: AVLayerVideoGravity {
        get { previewLayer.videoGravity }
        set { previewLayer.videoGravity = newValue }
    }
    
    public override func removeFromSuperview() {
        guard let view = PreviewViewFactory.shared.views.first(where: { $0.value == self }) else {
            return
        }
        PreviewViewFactory.shared.views.removeValue(forKey: view.key)
    }
    
    public func view() -> UIView {
        return self
    }
}
