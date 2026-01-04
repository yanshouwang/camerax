//
//  FileOutputOptions.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

public class FileOutputOptions: OutputOptions {
    public let url: URL
    
    private init(url: URL, fileSizeLimit: Int64, durationLimitMillis: Int64, location: CLLocation?) {
        self.url = url
        super.init(fileSizeLimit: fileSizeLimit, durationLimitMillis: durationLimitMillis, location: location)
    }
    
    public class Builder: OutputOptions.Builder<FileOutputOptions, Builder> {
        private var url: URL
        
        public init(_ file: URL) {
            self.url = file
        }
        
        public func build() -> FileOutputOptions {
            return FileOutputOptions(url: url, fileSizeLimit: fileSizeLimit, durationLimitMillis: durationLimitMillis, location: location)
        }
    }
}
