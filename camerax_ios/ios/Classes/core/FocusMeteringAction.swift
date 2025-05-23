//
//  FocusMeteringAction.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

public class FocusMeteringAction: NSObject {
    static let defaultMeteringMode: [MeteringMode] = [.af, .ae, .awb]
    static let defaultAutoCancelDurationMillis: Int64 = 5000
    
    public let meteringPointsAf: [MeteringPoint]
    public let meteringPointsAe: [MeteringPoint]
    public let meteringPointsAwb: [MeteringPoint]
    public let autoCancelDurationInMillis: Int64
    
    public var isAutoCancelEnabled: Bool {
        return autoCancelDurationInMillis > 0
    }
    
    init(_ builder: Builder) {
        self.meteringPointsAf = builder.meteringPointsAf
        self.meteringPointsAe = builder.meteringPointsAe
        self.meteringPointsAwb = builder.meteringPointsAwb
        self.autoCancelDurationInMillis = builder.autoCancelDurationInMillis
    }
    
    public class Builder: NSObject {
        var meteringPointsAf: [MeteringPoint]
        var meteringPointsAe: [MeteringPoint]
        var meteringPointsAwb: [MeteringPoint]
        var autoCancelDurationInMillis: Int64
        
        convenience init(_ point: MeteringPoint) {
            self.init(point, defaultMeteringMode)
        }
        
        public init(_ point: MeteringPoint, _ modes: [MeteringMode]) {
            self.meteringPointsAf = []
            self.meteringPointsAe = []
            self.meteringPointsAwb = []
            self.autoCancelDurationInMillis = defaultAutoCancelDurationMillis
            super.init()
            _ = self.addPoint(point, modes)
        }
        
        public func addPoint(_ point: MeteringPoint) -> Builder {
            return addPoint(point, defaultMeteringMode)
        }
        
        public func addPoint(_ point: MeteringPoint, _ modes: [MeteringMode]) -> Builder {
            if modes.contains(.af) {
                meteringPointsAf.append(point)
            }
            if modes.contains(.ae) {
                meteringPointsAe.append(point)
            }
            if modes.contains(.awb) {
                meteringPointsAwb.append(point)
            }
            return self
        }
        
        public func setAutoCancelDuration(_ duration: Int64, _ timeUnit: TimeUnit) throws -> Builder {
            if duration < 1 {
                throw CameraXError(code: "illegal-argument-error", message: "autoCancelDuration must be at least 1", details: nil)
            }
            autoCancelDurationInMillis = timeUnit.toMillis(duration)
            return self
        }
        
        public func disableAutoCancel() -> Builder {
            autoCancelDurationInMillis = 0
            return self
        }
        
        public func build() -> FocusMeteringAction {
            return FocusMeteringAction(self)
        }
    }
}
