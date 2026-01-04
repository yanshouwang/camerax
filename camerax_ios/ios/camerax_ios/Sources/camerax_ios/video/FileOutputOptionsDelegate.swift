//
//  FileOutputOptionsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation
import CoreLocation

class FileOutputOptionsDelegate: PigeonApiDelegateFileOutputOptionsProxyApi {
    class BuilderDelegate: PigeonApiDelegateFileOutputOptionsBuilderProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiFileOutputOptionsBuilderProxyApi, file: String) throws -> FileOutputOptions.Builder {
            return FileOutputOptions.Builder(file.urlDelegate)
        }
        
        func setDurationLimitMillis(pigeonApi: PigeonApiFileOutputOptionsBuilderProxyApi, pigeonInstance: FileOutputOptions.Builder, durationLimitMillis: Int64) throws -> FileOutputOptions.Builder {
            return pigeonInstance.setDurationLimitMillis(durationLimitMillis)
        }
        
        func setFileSizeLimit(pigeonApi: PigeonApiFileOutputOptionsBuilderProxyApi, pigeonInstance: FileOutputOptions.Builder, fileSizeLimitBytes: Int64) throws -> FileOutputOptions.Builder {
            return pigeonInstance.setFileSizeLimit(fileSizeLimitBytes)
        }
        
        func setLocation(pigeonApi: PigeonApiFileOutputOptionsBuilderProxyApi, pigeonInstance: FileOutputOptions.Builder, location: CLLocation?) throws -> FileOutputOptions.Builder {
            return pigeonInstance.setLocation(location)
        }
        
        func build(pigeonApi: PigeonApiFileOutputOptionsBuilderProxyApi, pigeonInstance: FileOutputOptions.Builder) throws -> FileOutputOptions {
            return pigeonInstance.build()
        }
    }
    
    func getFile(pigeonApi: PigeonApiFileOutputOptionsProxyApi, pigeonInstance: FileOutputOptions) throws -> String {
        return pigeonInstance.url.absoluteString
    }
}
