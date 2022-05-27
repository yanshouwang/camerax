import AVFoundation
import Flutter

public class SwiftCameraXPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, FlutterTexture, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureMetadataOutputObjectsDelegate {
    
    enum FLTResolutionPreset : String {
        case veryLow
        case low
        case medium
        case high
        case veryHigh
        case ultraHigh
        case max
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftCameraXPlugin(registrar.textures())
        
        let method = FlutterMethodChannel(name: "yanshouwang.dev/camerax/method", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: method)
        
        let event = FlutterEventChannel(name: "yanshouwang.dev/camerax/event", binaryMessenger: registrar.messenger())
        event.setStreamHandler(instance)
    }
    
    private let registry: FlutterTextureRegistry
    private var sink: FlutterEventSink!
    private var textureId: Int64!
    private var captureSession: AVCaptureSession!
    private var device: AVCaptureDevice!
    private var latestBuffer: CVImageBuffer!
    private let metadataOutput: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    private var analyzeMode: Int
    private var analyzing: Bool
    private let cameraOutputQueue = DispatchQueue(label:"flutter_camera_output_queue", qos: .userInteractive)
    private let metadataOutputQueue = DispatchQueue(label:"flutter_camera_metadata_output_queue", qos: .userInteractive)
    private var previewSize = CGSize.zero

    
    init(_ registry: FlutterTextureRegistry) {
        self.registry = registry
        analyzeMode = 0
        analyzing = false
        super.init()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "state":
            stateNative(call, result)
        case "request":
            requestNative(call, result)
        case "start":
            startNative(call, result)
        case "torch":
            torchNative(call, result)
        case "analyze":
            analyzeNative(call, result)
        case "stop":
            stopNative(result)
        case "getMaxZoomLevel":
            getMaxZoomLevel(result: result)
        case "getMinZoomLevel":
            getMinZoomLevel(result: result)
        case "setZoomLevel":
            setZoomLevel(call, result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        return nil
    }
    
    public func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        if latestBuffer == nil {
            return nil
        }
        return Unmanaged<CVPixelBuffer>.passRetained(latestBuffer)
    }
    
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        latestBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        registry.textureFrameAvailable(textureId)
        
    }
    
    func stateNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .notDetermined:
            result(0)
        case .authorized:
            result(1)
        default:
            result(2)
        }
    }
    
    func requestNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { result($0) })
    }
    
    func startNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        textureId = registry.register(self)
        captureSession = AVCaptureSession()
        let position = call.arguments as! Int == 0 ? AVCaptureDevice.Position.front : .back
        if #available(iOS 10.0, *) {
            device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: position).devices.first
        } else {
            device = AVCaptureDevice.devices(for: .video).filter({$0.position == position}).first
        }
        device.addObserver(self, forKeyPath: #keyPath(AVCaptureDevice.torchMode), options: .new, context: nil)
        captureSession.beginConfiguration()
        // Add device input.
        do {
            let input = try AVCaptureDeviceInput(device: device)
            captureSession.addInput(input)
        } catch {
            error.throwNative(result)
        }
        // Add video output.
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: cameraOutputQueue)
        captureSession.addOutput(videoOutput)
        for connection in videoOutput.connections {
            connection.videoOrientation = .portrait
            if position == .front && connection.isVideoMirroringSupported {
                connection.isVideoMirrored = true
            }
        }
        if let sessionPreset = (call.arguments as? [String: Any])?["resolutionPreset"] as? String, let preset = FLTResolutionPreset(rawValue: sessionPreset) {
            setSessionPresetAndPreview(flutterPreset: preset)
        }
        metadataOutput.setMetadataObjectsDelegate(self, queue: metadataOutputQueue)
        enableQR(enable: true)
        captureSession.commitConfiguration()
        captureSession.startRunning()
        let demensions = CMVideoFormatDescriptionGetDimensions(device.activeFormat.formatDescription)
        let width = Double(demensions.height)
        let height = Double(demensions.width)
        let size = ["width": width, "height": height]
        let answer: [String : Any?] = ["textureId": textureId, "size": size, "torchable": device.hasTorch]
        result(answer)
    }
    
    private func analyzeNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        analyzeMode = call.arguments as! Int
        result(nil)
    }
    
    private func stopNative(_ result: FlutterResult) {
        captureSession.stopRunning()
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        device.removeObserver(self, forKeyPath: #keyPath(AVCaptureDevice.torchMode))
        registry.unregisterTexture(textureId)
        
        analyzeMode = 0
        latestBuffer = nil
        captureSession = nil
        device = nil
        textureId = nil
        
        result(nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "torchMode":
            // off = 0; on = 1; auto = 2;
            let state = change?[.newKey] as? Int
            let event: [String: Any?] = ["name": "torchState", "data": state]
            sink?(event)
        default:
            break
        }
    }
    
    //MARK: TORCH
    private func torchNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        do {
            try device.lockForConfiguration()
            device.torchMode = call.arguments as! Int == 1 ? .on : .off
            device.unlockForConfiguration()
            result(nil)
        } catch {
            error.throwNative(result)
        }
    }
    
    //MARK: METADATA
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let qrData = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            debugPrint("qr detected \(qrData.stringValue ?? "")")
        }
    }
    
    private func enableQRDetection(enable: Bool) {
        captureSession.beginConfiguration()
        enableQR(enable: enable)
        captureSession.commitConfiguration()
    }
    
    private func enableQR(enable: Bool) {
        if enable {
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                metadataOutput.metadataObjectTypes = [.qr]
            }
        } else {
            captureSession.removeOutput(metadataOutput)
        }
    }
    
    //MARK: SESSION PRESET
    private func setSessionPresetAndPreview(flutterPreset: FLTResolutionPreset) {
        switch flutterPreset {
        case .max,.ultraHigh:
            if captureSession.canSetSessionPreset(.hd4K3840x2160) {
                captureSession.sessionPreset = .hd4K3840x2160
                previewSize = CGSize(width: 3840, height: 2160)
                break
            }
            if captureSession.canSetSessionPreset(.high) {
                captureSession.sessionPreset = .high
                previewSize = CGSize(width: Int(device.activeFormat.highResolutionStillImageDimensions.width), height: Int(device.activeFormat.highResolutionStillImageDimensions.height))
                break
            }
        case .veryHigh:
            if captureSession.canSetSessionPreset(.hd1920x1080) {
                captureSession.sessionPreset = .hd1920x1080
                previewSize = CGSize(width: 1920, height: 1080)
                break
            }
        case .high:
            if captureSession.canSetSessionPreset(.hd1280x720) {
                captureSession.sessionPreset = .hd1280x720
                previewSize = CGSize(width: 1280, height: 720)
                break
            }
        case .medium:
            if captureSession.canSetSessionPreset(.vga640x480) {
                captureSession.sessionPreset = .vga640x480
                previewSize = CGSize(width: 640, height: 480)
                break
            }
        case .low:
            if captureSession.canSetSessionPreset(.cif352x288) {
                captureSession.sessionPreset = .cif352x288
                previewSize = CGSize(width: 352, height: 288)
                break
            }
        default:
            if captureSession.canSetSessionPreset(.cif352x288) {
                captureSession.sessionPreset = .cif352x288
                previewSize = CGSize(width: 352, height: 288)
                break
            }
        }
    }
    
    //MARK: ZOOM
    private func getMaxZoomLevel(result: @escaping FlutterResult) {
        @MainThreadClosure var mainThreadResult: ((Any?) -> Void)? = result
        mainThreadResult?(NSNumber(floatLiteral: device.maxZoom))

    }
    
    private func getMinZoomLevel(result: @escaping FlutterResult) {
        @MainThreadClosure var mainThreadResult: ((Any?) -> Void)? = result
        mainThreadResult?(NSNumber(floatLiteral: device.minZoom))
    }
    
    private func setZoomLevel(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if let zoomLevel = (call.arguments as? [String:Any])?["zoom"] as? NSNumber {
            setZoomLevel(zoomLevel: CGFloat(zoomLevel.floatValue), result: result)
        } else {
            @MainThreadClosure var mainThreadResult: ((Any?) -> Void)? = result
            mainThreadResult?(FlutterError(code: "zoom_error", message: "zoom value not passed", details: nil))
        }
    }
    
    private func setZoomLevel(zoomLevel: CGFloat, result: @escaping FlutterResult) {
        @MainThreadClosure var mainThreadResult: ((Any?) -> Void)? = result
        var newZoom = zoomLevel
        if zoomLevel < device.minZoom {
            newZoom = device.minZoom
        }
        if zoomLevel > device.maxZoom {
            newZoom = device.maxZoom
        }
        do {
            try device.lockForConfiguration()
            device.videoZoomFactor = newZoom
            device.unlockForConfiguration()
            mainThreadResult?(nil)
        } catch {
            mainThreadResult?(FlutterError(code: "zoom_error", message: "couldn't lock device", details: nil))
        }
    }
}
