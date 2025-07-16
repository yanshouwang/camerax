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
    
    public var previewLayer: AVCaptureVideoPreviewLayer {
        super.layer as! AVCaptureVideoPreviewLayer
    }
    
    public var controller: CameraController? {
        didSet { previewLayer.session = controller?.session }
    }
    
    public var scaleType: ScaleType {
        get { previewLayer.videoGravity.api }
        set { previewLayer.videoGravity = newValue.impl }
    }
    
    private let tapGestureRecognizer: UITapGestureRecognizer
    private let pinchGestureRecognizer: UIPinchGestureRecognizer
    
    public override init(frame: CGRect) {
        self.tapGestureRecognizer = UITapGestureRecognizer()
        self.pinchGestureRecognizer = UIPinchGestureRecognizer()
        super.init(frame: frame)
        self.previewLayer.videoGravity = .resizeAspectFill
        self.tapGestureRecognizer.addTarget(self, action: #selector(handleTap(sender:)))
        self.pinchGestureRecognizer.addTarget(self, action: #selector(handlePinch(sender:)))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addGestureRecognizer(pinchGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(handleOrientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    deinit {
        self.removeGestureRecognizer(tapGestureRecognizer)
        self.removeGestureRecognizer(pinchGestureRecognizer)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let controller, controller.isTapToFocusEnabled() else {
            return
        }
        let layerPoint = sender.location(in: self)
        let devicePoint = previewLayer.captureDevicePointConverted(fromLayerPoint: layerPoint)
        _ = try? controller.startFocusAndMetering(devicePoint, false)
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
            let zoomRatio = MathUtils.clamp(sender.scale, min: minZoomRatio, max: maxZoomRatio)
            try? controller.setZoomRatio(zoomRatio)
        default:
            break
        }
    }
    
    @objc func handleOrientationDidChange() {
        let orientation = UIDevice.current.orientation
        guard let connection = previewLayer.connection, let videoOrientation = orientation.videoOrientation else { return }
        connection.videoOrientation = videoOrientation
    }
    
    public enum ScaleType: Int {
        case fillCenter, fillEnd, fillStart, fitCenter, fitEnd, fitStart
    }
}

extension UIDeviceOrientation {
    var videoOrientation: AVCaptureVideoOrientation? {
        switch self {
        case .portrait:
            return .portrait
        case .portraitUpsideDown:
            return .portraitUpsideDown
        case .landscapeLeft:
            return .landscapeRight
        case .landscapeRight:
            return .landscapeLeft
        default:
            return nil
        }
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
