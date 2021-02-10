import AVFoundation
import Flutter
import MLKitVision
import MLKitBarcodeScanning

public class SwiftCameraXPlugin:
    NSObject,
    FlutterPlugin,
    FlutterStreamHandler,
    FlutterTexture,
    AVCaptureVideoDataOutputSampleBufferDelegate {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftCameraXPlugin(registrar.textures())
        
        let method = FlutterMethodChannel(name: "yanshouwang.dev/camerax/method", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: method)
        
        let event = FlutterEventChannel(name: "yanshouwang.dev/camerax/event", binaryMessenger: registrar.messenger())
        event.setStreamHandler(instance)
    }
    
    let registry: FlutterTextureRegistry
    var detecting = false
    var sink: FlutterEventSink!
    var instanceId: Int!
    var textureId: Int64!
    var device: AVCaptureDevice!
    var captureSession: AVCaptureSession!
    var size: [String: Double]!
    var latestBuffer: CVImageBuffer!
    
    init(_ registry: FlutterTextureRegistry) {
        self.registry = registry
        super.init()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "state":
            stateNative(call, result)
        case "request":
            requestNative(call, result)
        case "init":
            initNative(call, result)
        case "dispose":
            disposeNative(call, result)
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
        
        if !detecting {
            detecting = true
            
            let buffer = CMSampleBufferGetImageBuffer(sampleBuffer)
            let image = VisionImage(image: buffer!.image)
            let scanner = BarcodeScanner.barcodeScanner()
            scanner.process(image) { barcodes, error in
                if error == nil && barcodes != nil {
                    for barcode in barcodes! {
                        let item = barcode.data
                        self.sink?(item)
                    }
                }
                self.detecting = false
            }
        }
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
        AVCaptureDevice.requestAccess(
            for: .video,
            completionHandler: { result($0) }
        )
    }
    
    func initNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if instanceId != nil {
            closeCamera()
            instanceId = nil
        }
        let arguments = call.arguments as! [Any]
        let id = arguments[0] as! Int
        let position = arguments[1] as! Int == 0 ? AVCaptureDevice.Position.front : .back
        do {
            try openCamera(position)
            instanceId = id
            let answer: [String : Any?] = ["textureId": textureId, "size": size, "torchable": device.hasTorch]
            result(answer)
        } catch {
            error.throwNative(result)
        }
    }
    
    func disposeNative(_ call: FlutterMethodCall, _ result: FlutterResult) {
        let id = call.arguments as! Int
        if id == instanceId {
            closeCamera()
            instanceId = nil
        }
        result(nil)
    }
    
    func openCamera(_ position: AVCaptureDevice.Position) throws {
        textureId = registry.register(self)
        if #available(iOS 10.0, *) {
            device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: position).devices.first
        } else {
            device = AVCaptureDevice.devices(for: .video).filter({$0.position == position}).first
        }
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        let input = try AVCaptureDeviceInput(device: device)
        captureSession.addInput(input)
        // Add video output.
        let videoOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(videoOutput)
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String:  kCVPixelFormatType_32BGRA]
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
        for connection in videoOutput.connections {
            connection.videoOrientation = .portrait
            if position == .front && connection.isVideoMirroringSupported {
                connection.isVideoMirrored = true
            }
        }
        captureSession.commitConfiguration()
        captureSession.startRunning()
        let demensions = CMVideoFormatDescriptionGetDimensions(device.activeFormat.formatDescription)
        let width = Double(demensions.height)
        let height = Double(demensions.width)
        size = ["width": width, "height": height]
    }
    
    func closeCamera() {
        captureSession.stopRunning()
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        registry.unregisterTexture(textureId)
        
        latestBuffer = nil
        size = nil
        captureSession = nil
        device = nil
        textureId = nil
    }
}
