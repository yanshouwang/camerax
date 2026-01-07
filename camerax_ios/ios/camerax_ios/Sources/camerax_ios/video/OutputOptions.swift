//
//  OutputOptions.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/23.
//

import Foundation
import CoreLocation

public class OutputOptions: NSObject {
    public static let fileSizeUnlimited: Int64 = 0
    public static let durationUnlimited: Int64 = 0
    
    public let fileSizeLimit: Int64
    public let durationLimitMillis: Int64
    public let location: CLLocation?
    
    init(fileSizeLimit: Int64, durationLimitMillis: Int64, location: CLLocation?) {
        self.fileSizeLimit = fileSizeLimit
        self.location = location
        self.durationLimitMillis = durationLimitMillis
    }
    
    public typealias Builder<T: OutputOptions, B> = BuilderBase<B> & BuilderProtocol
    
    public class BuilderBase<B>: NSObject {
        var fileSizeLimit: Int64
        var durationLimitMillis: Int64
        var location: CLLocation?
        
        override init() {
            fileSizeLimit = OutputOptions.fileSizeUnlimited
            durationLimitMillis = OutputOptions.durationUnlimited
            super.init()
        }
        
        public func setFileSizeLimit(_ fileSizeLimitBytes: Int64) -> B {
            self.fileSizeLimit = fileSizeLimitBytes
            return self as! B
        }
        
        public func setDurationLimitMillis(_ durationLimitMillis: Int64) -> B {
            self.durationLimitMillis = durationLimitMillis
            return self as! B
        }
        
        public func setLocation(_ location: CLLocation?) -> B {
            self.location = location
            return self as! B
        }
    }
    
    public protocol BuilderProtocol<T>: NSObjectProtocol {
        associatedtype T: OutputOptions
        
        func build() -> T
    }
}
