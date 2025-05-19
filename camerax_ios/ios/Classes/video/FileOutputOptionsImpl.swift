//
//  FileOutputOptionsImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation
import CoreLocation

class FileOutputOptionsImpl: PigeonApiDelegateFileOutputOptionsApi {
    func build(pigeonApi: PigeonApiFileOutputOptionsApi, file: String, durationLimitMillis: Int64?, fileSizeLimitBytes: Int64?, location: CLLocation?) throws -> FileOutputOptions {
        fatalError()
    }
    
    func file(pigeonApi: PigeonApiFileOutputOptionsApi, pigeonInstance: FileOutputOptions) throws -> String {
        fatalError()
    }
}
