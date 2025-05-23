//
//  FileOutputOptionsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation
import CoreLocation

class FileOutputOptionsDelegate: PigeonApiDelegateFileOutputOptionsApi {
    func build(pigeonApi: PigeonApiFileOutputOptionsApi, file: String, durationLimitMillis: Int64?, fileSizeLimitBytes: Int64?, location: CLLocation?) throws -> FileOutputOptions {
        let url = URL(fileURLWithPath: file)
        let builder = FileOutputOptions.Builder(url)
        if let durationLimitMillis {
            _ = builder.setDurationLimitMillis(durationLimitMillis)
        }
        if let fileSizeLimitBytes {
            _ = builder.setFileSizeLimit(fileSizeLimitBytes)
        }
        if let location {
            _ = builder.setLocation(location)
        }
        return builder.build()
    }
    
    func getFile(pigeonApi: PigeonApiFileOutputOptionsApi, pigeonInstance: FileOutputOptions) throws -> String {
        return pigeonInstance.url.absoluteString
    }
}
