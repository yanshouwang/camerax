//
//  PreviewView.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/9.
//

import AVFoundation
import Flutter

@objc public class PreviewView: UIView {
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
    
    public override func didMoveToSuperview() {
        debugPrint("Preview didMoveToSuperview")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        addGestureRecognizer(tapGestureRecognizer)
        addGestureRecognizer(pinchGestureRecognizer)
    }
    
    public override func removeFromSuperview() {
        debugPrint("Preview removeFromSuperview")
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let controller, controller.isTapToFocusEnabled() else {
            return
        }
        let layerPoint = sender.location(in: self)
        let devicePoint = previewLayer.captureDevicePointConverted(fromLayerPoint: layerPoint)
        try? controller.focusAndExpose(devicePoint: devicePoint, continuous: false)
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        guard let controller, controller.isPinchToZoomEnabled(), let zoomState = controller.getZoomState() else {
            return
        }
        switch sender.state {
        case .began:
            sender.scale = zoomState.zoomRatio
        case .changed:
            let minZoomRatio = zoomState.minZoomRatio
            let maxZoomRatio = zoomState.maxZoomRatio
            let zoomRatio = min(max(sender.scale, minZoomRatio), maxZoomRatio)
            try? controller.setZoomRatio(zoomRatio)
        default:
            break
        }
    }
}
