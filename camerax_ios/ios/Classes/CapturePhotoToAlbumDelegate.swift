//
//  CapturePhotoDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation
import AVFoundation
import Photos

class CapturePhotoToAlbumDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    let name: String?
    let handler: (String?, (any Error)?) -> Void
    
    init(name: String?, completionHandler handler: @escaping (String?, (any Error)?) -> Void) {
        self.name = name
        self.handler = handler
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        if let error {
            handler(nil, error)
        }
        func onPHAuthorized(_ status: PHAuthorizationStatus) {
            if status == .authorized {
                savePhoto(photo)
            } else {
                handler(nil, CameraXError.unauthorized)
            }
        }
        if #available(iOS 14, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in onPHAuthorized(status) }
            } else {
                onPHAuthorized(status)
            }
        } else {
            let status = PHPhotoLibrary.authorizationStatus()
            if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization() { status in onPHAuthorized(status) }
            } else {
                onPHAuthorized(status)
            }
        }
    }
    
    func savePhoto(_ photo: AVCapturePhoto) {
        if let photoData = photo.fileDataRepresentation() {
            var localIdentifiers = [String]()
            PHPhotoLibrary.shared().performChanges() { [self] in
                let creationRequest = PHAssetCreationRequest.forAsset()
                if let localIdentifier = creationRequest.placeholderForCreatedAsset?.localIdentifier {
                    localIdentifiers.append(localIdentifier)
                    let options = PHAssetResourceCreationOptions()
                    options.originalFilename = name
                    creationRequest.addResource(with: .photo, data: photoData, options: options)
                } else {
                    handler(nil, CameraXError.saveLocalIdentifierNil)
                }
            } completionHandler: { [self] success, error in
                if let error {
                    handler(nil, error)
                } else if let asset = PHAsset.fetchAssets(withLocalIdentifiers: localIdentifiers, options: nil).firstObject {
                    PHImageManager().requestAVAsset(forVideo: asset, options: nil) { [self] avAsset, _,_ in
                        if let avURLAsset = avAsset as? AVURLAsset {
                            let url = avURLAsset.url.absoluteString
                            handler(url, nil)
                        } else {
                            handler(nil, CameraXError.saveAssetNil)
                        }
                    }
                } else {
                    handler(nil, CameraXError.saveAssetNil)
                }
            }
        } else {
            handler(nil, CameraXError.savePhotoNil)
        }
    }
}
