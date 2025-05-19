//
//  PreviewView.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/9.
//

import AVFoundation
import Flutter

public class PreviewView: UIView {
    // Use a capture video preview layer as the view's backing layer.
    public override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    public override var layer: AVCaptureVideoPreviewLayer {
        super.layer as! AVCaptureVideoPreviewLayer
    }
    
    public var controller: CameraController? {
        didSet { layer.session = controller?.session }
    }
    
    public var scaleType: ScaleType {
        get { layer.videoGravity.api }
        set { layer.videoGravity = newValue.impl }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        layer.videoGravity = .resizeAspectFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        addGestureRecognizer(tapGestureRecognizer)
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        addGestureRecognizer(pinchGestureRecognizer)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let controller, controller.isTapToFocusEnabled else {
            return
        }
        let layerPoint = sender.location(in: self)
        let devicePoint = layer.captureDevicePointConverted(fromLayerPoint: layerPoint)
        try? controller.focusAndExpose(devicePoint: devicePoint, continuous: false)
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        guard let controller, controller.isPinchToZoomEnabled, let zoomState = controller.zoomState else {
            return
        }
        switch sender.state {
        case .began:
            sender.scale = zoomState.zoomRatio
        case .changed:
            let minZoomRatio = zoomState.minZoomRatio
            let maxZoomRatio = zoomState.maxZoomRatio
            let zoomRatio = MathUtils.clamp(sender.scale, min: minZoomRatio, max: maxZoomRatio)
            try? controller.setZoomRatio(zoomRatio)
        default:
            break
        }
    }
    
    public enum ScaleType: Int {
        case fillCenter, fillEnd, fillStart, fitCenter, fitEnd, fitStart
    }
}

extension PreviewView.ScaleType {
    var impl: AVLayerVideoGravity {
        switch self {
        case .fillCenter:
            return .resizeAspectFill
        case .fillEnd:
            fatalError()
        case .fillStart:
            fatalError()
        case .fitCenter:
            return .resizeAspect
        case .fitEnd:
            fatalError()
        case .fitStart:
            fatalError()
        }
    }
}

extension AVLayerVideoGravity {
    var api: PreviewView.ScaleType {
        switch self {
        case .resizeAspectFill:
            return .fillCenter
        case .resizeAspect:
            return .fitCenter
        case .resize:
            fatalError()
        default:
            fatalError()
        }
    }
}
