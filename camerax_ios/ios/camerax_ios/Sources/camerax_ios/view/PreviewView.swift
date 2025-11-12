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
    
    public var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        guard let layer = layer as? AVCaptureVideoPreviewLayer else {
            fatalError("Expected `AVCaptureVideoPreviewLayer` type for layer. Check PreviewView.layerClass implementation.")
        }
        return layer
    }
    
    private let tapGestureRecognizer: UITapGestureRecognizer
    private let pinchGestureRecognizer: UIPinchGestureRecognizer
    private var controller: CameraController?
    
    private var session: AVCaptureSession? {
        get { self.videoPreviewLayer.session }
        set { self.videoPreviewLayer.session = newValue }
    }
    
    private var videoGravity: AVLayerVideoGravity {
        get { self.videoPreviewLayer.videoGravity }
        set { self.videoPreviewLayer.videoGravity = newValue }
    }
    
    public override init(frame: CGRect) {
        self.tapGestureRecognizer = UITapGestureRecognizer()
        self.pinchGestureRecognizer = UIPinchGestureRecognizer()
        super.init(frame: frame)
        self.videoPreviewLayer.videoGravity = .resizeAspectFill
        self.tapGestureRecognizer.addTarget(self, action: .handleTapGestureRecognizer)
        self.pinchGestureRecognizer.addTarget(self, action: .handlePinchGestureRecognizer)
        self.addGestureRecognizer(self.tapGestureRecognizer)
        self.addGestureRecognizer(self.pinchGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: .handleOrientationDidChangeNotification, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    deinit {
        self.tapGestureRecognizer.removeTarget(self, action: .handleTapGestureRecognizer)
        self.pinchGestureRecognizer.removeTarget(self, action: .handlePinchGestureRecognizer)
        self.removeGestureRecognizer(self.tapGestureRecognizer)
        self.removeGestureRecognizer(self.pinchGestureRecognizer)
        NotificationCenter.default.removeObserver(self)
    }
    
    public func getController() -> CameraController? {
        return self.controller
    }
    
    public func setController(_ controller: CameraController?) {
        if let oldController = self.controller {
            oldController.videoPreviewLayer = nil
        }
        if let newController = controller {
            newController.videoPreviewLayer = self.videoPreviewLayer
            self.controller = newController
            self.session = newController.session
            updateVideoOrientation()
        } else {
            self.controller = nil
            self.session = nil
        }
    }
    
    public func getScaleType() -> ScaleType {
        return self.videoGravity.scaleType
    }
    
    public func setScaleType(_ scaleType: ScaleType) {
        self.videoGravity = scaleType.videoGravity
    }
    
    @objc fileprivate func handleTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        guard let controller = self.controller , controller.isTapToFocusEnabled() else {
            return
        }
        let control = controller.getCameraControl()
        let layerPoint = sender.location(in: self)
        let devicePoint = self.videoPreviewLayer.captureDevicePointConverted(fromLayerPoint: layerPoint)
        _ = try? control.startFocusAndMetering(devicePoint, false)
    }
    
    @objc fileprivate func handlePinchGestureRecognizer(_ sender: UIPinchGestureRecognizer) {
        guard let controller = self.controller, controller.isPinchToZoomEnabled(), let zoomState = controller.getZoomState().getValue() else {
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
    
    @objc fileprivate func handleOrientationDidChangeNotification(_ notification: Notification) {
        updateVideoOrientation()
    }
    
    private func updateVideoOrientation() {
        let orientation = UIDevice.current.orientation
        debugPrint("ui device orientation: \(orientation)")
        guard let videoOrientation = orientation.videoOrientation else { return }
        debugPrint("update video preview layer orientation: \(videoOrientation)")
        guard let connection = self.videoPreviewLayer.connection else {
            debugPrint("connection is nil")
            return
        }
        connection.videoOrientation = videoOrientation
    }
    
    public enum ScaleType: Int {
        case fillCenter, fillEnd, fillStart, fitCenter, fitEnd, fitStart
    }
}

fileprivate extension Selector {
    static var handleTapGestureRecognizer: Selector {
        return #selector(PreviewView.handleTapGestureRecognizer(_:))
    }
    
    static var handlePinchGestureRecognizer: Selector {
        return #selector(PreviewView.handlePinchGestureRecognizer(_:))
    }
    
    static var handleOrientationDidChangeNotification: Selector {
        return #selector(PreviewView.handleOrientationDidChangeNotification(_:))
    }
}

fileprivate extension PreviewView.ScaleType {
    var videoGravity: AVLayerVideoGravity {
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

fileprivate extension AVLayerVideoGravity {
    var scaleType: PreviewView.ScaleType {
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

fileprivate extension UIDeviceOrientation {
    var videoOrientation: AVCaptureVideoOrientation? {
        switch self {
        case .portrait, .portraitUpsideDown:
            return .portrait
        case .landscapeLeft:
            return .landscapeRight
        case .landscapeRight:
            return .landscapeLeft
        default:
            return nil
        }
    }
}
