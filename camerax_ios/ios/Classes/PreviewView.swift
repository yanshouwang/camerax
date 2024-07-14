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
    
    @objc public var controller: CameraController? {
        didSet { previewLayer.session = controller?.session }
    }
    
    @objc public var scaleType: ScaleType {
        get { previewLayer.videoGravity.xValue }
        set { previewLayer.videoGravity = newValue.avfValue }
    }
    
    public override func removeFromSuperview() {
        PreviewViewFactory.shared.removeView(self)
    }
    
    public func view() -> UIView {
        return self
    }
}
