//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

@objc public class CameraController: NSObject {
    let session: AVCaptureSession
    @objc dynamic var videoDeviceInput: AVCaptureDeviceInput?
    @objc dynamic var zoomState: ZoomState?
    var zoomStateObservation: NSKeyValueObservation?
    
    override init() {
        session = AVCaptureSession()
        super.init()
        addVideoDeviceInput(cameraSelector: .back)
    }
    
    func requestPermissions(enableAudio: Bool, completionHandler handler: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { videoGranted in
            if enableAudio {
                AVCaptureDevice.requestAccess(for: .audio) { audioGranted in
                    handler(videoGranted && audioGranted)
                }
            } else {
                handler(videoGranted)
            }
        }
    }
    
    func bindToLifecycle() throws {
        session.startRunning()
    }
    
    func unbind() {
        session.stopRunning()
    }
    
    func hasCamera(cameraSelector: CameraSelector) -> Bool {
        let position = cameraSelector.lensFacing.avPosition
        return AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position) != nil
    }
    
    func setCameraSelector(cameraSelector: CameraSelector) {
        session.beginConfiguration()
        defer { session.commitConfiguration() }
        removeVideoDeviceInput()
        addVideoDeviceInput(cameraSelector: cameraSelector)
        
    }
    
    func getZoomState() -> ZoomState? {
        return zoomState
    }
    
    func addZoomStateObserver(callback: @escaping (ZoomState?) -> Void) {
        zoomStateObservation = observe(\.zoomState, options: .new) { obj, change in
            guard let zoomState = change.newValue else {
                return
            }
            callback(zoomState)
        }
    }
    
    func removeZoomStateObserver() throws {
        guard let observation = zoomStateObservation else {
            throw CameraXError.observationNil
        }
        observation.invalidate()
    }
    
    func setZoomRatio(zoomRatio: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraXError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        videoDevice.videoZoomFactor = zoomRatio
    }
    
    func setLinearZoom(linearZoom: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraXError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        videoDevice.videoZoomFactor = videoDevice.minAvailableVideoZoomFactor + linearZoom * (videoDevice.maxAvailableVideoZoomFactor - videoDevice.minAvailableVideoZoomFactor)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case #keyPath(AVCaptureDevice.minAvailableVideoZoomFactor):
            fallthrough
        case #keyPath(AVCaptureDevice.maxAvailableVideoZoomFactor):
            fallthrough
        case #keyPath(AVCaptureDevice.videoZoomFactor):
            onZoomStateChanged()
        default:
            break
        }
    }
    
    private func removeVideoDeviceInput() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            return
        }
        session.removeInput(videoDeviceInput)
        self.videoDeviceInput = nil
        let videoDevice = videoDeviceInput.device
        videoDevice.removeObserver(self, forKeyPath: #keyPath(AVCaptureDevice.minAvailableVideoZoomFactor))
        videoDevice.removeObserver(self, forKeyPath: #keyPath(AVCaptureDevice.maxAvailableVideoZoomFactor))
        videoDevice.removeObserver(self, forKeyPath: #keyPath(AVCaptureDevice.videoZoomFactor))
    }
    
    private func addVideoDeviceInput(cameraSelector: CameraSelector) {
        let position = cameraSelector.lensFacing.avPosition
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position),
              let videoDeviceInput = try? AVCaptureDeviceInput.init(device: videoDevice),
              session.canAddInput(videoDeviceInput) else {
            onZoomStateChanged()
            return
        }
        session.addInput(videoDeviceInput)
        self.videoDeviceInput = videoDeviceInput
        videoDevice.addObserver(self, forKeyPath: #keyPath(AVCaptureDevice.minAvailableVideoZoomFactor), options: .new, context: nil)
        videoDevice.addObserver(self, forKeyPath: #keyPath(AVCaptureDevice.maxAvailableVideoZoomFactor), options: .new, context: nil)
        videoDevice.addObserver(self, forKeyPath: #keyPath(AVCaptureDevice.videoZoomFactor), options: [.initial, .new], context: nil)
    }
    
    private func onZoomStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            zoomState = nil
            return
        }
        let device = videoDeviceInput.device
        zoomState = ZoomState(minZoomRatio: device.minAvailableVideoZoomFactor, maxZoomRatio: device.maxAvailableVideoZoomFactor, zoomRatio: device.videoZoomFactor)
    }
}
