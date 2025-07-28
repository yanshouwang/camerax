//
//  Recording.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation

public class Recording: NSObject, AutoCloseable {
    private let output: AVCaptureFileOutput
    
    init(_ output: AVCaptureFileOutput) {
        self.output = output
    }
    
    public func isPersistent() throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isPersistent is not implemented", details: nil)
    }
    
    public func close() {
        stop()
    }
    
    public func mute(_ muted: Bool) throws -> Void {
        guard let connection = output.connection(with: .audio) else {
            throw CameraXError(code: "nil-error", message: "connection is nil", details: nil)
        }
        connection.isEnabled = !muted
    }
    
    public func pause() throws -> Void {
        if #available(iOS 18.0, *) {
            output.pauseRecording()
        } else {
            throw CameraXError(code: "unsupported-error", message: "pause is not supported before iOS 18.0", details: nil)
        }
    }
    
    public func resume() throws -> Void {
        if #available(iOS 18.0, *) {
            output.resumeRecording()
        } else {
            throw CameraXError(code: "unsupported-error", message: "resume is not supported before iOS 18.0", details: nil)
        }
    }
    
    public func stop() -> Void {
        output.stopRecording()
    }
}
