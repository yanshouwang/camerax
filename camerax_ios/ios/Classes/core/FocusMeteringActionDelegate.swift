//
//  FocusMeteringActionDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class FocusMeteringActionDelegate: PigeonApiDelegateFocusMeteringActionApi {
    func build(pigeonApi: PigeonApiFocusMeteringActionApi, first: MeteringPointTuple, others: [MeteringPointTuple]?, disableAutoCancel: Bool?, autoCancelDuration: DurationTuple?) throws -> FocusMeteringAction {
        let builder = if let modes = first.modes { FocusMeteringAction.Builder(first.point, modes) }
        else { FocusMeteringAction.Builder(first.point) }
        if let others {
            for other in others {
                _ = if let modes = other.modes { builder.addPoint(other.point, modes) }
                else { builder.addPoint(other.point) }
            }
        }
        if disableAutoCancel != nil {
            _ = builder.disableAutoCancel()
        }
        if let autoCancelDuration {
            _ = try builder.setAutoCancelDuration(autoCancelDuration.duration, autoCancelDuration.timeUnit)
        }
        return builder.build()
    }
    
    func getAutoCancelDurationInMillis(pigeonApi: PigeonApiFocusMeteringActionApi, pigeonInstance: FocusMeteringAction) throws -> Int64 {
        return pigeonInstance.autoCancelDurationInMillis
    }
    
    func getMeteringPointsAe(pigeonApi: PigeonApiFocusMeteringActionApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAe
    }
    
    func getMeteringPointsAf(pigeonApi: PigeonApiFocusMeteringActionApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAf
    }
    
    func getMeteringPointsAwb(pigeonApi: PigeonApiFocusMeteringActionApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAwb
    }
    
    func isAutoCancelEnabled(pigeonApi: PigeonApiFocusMeteringActionApi, pigeonInstance: FocusMeteringAction) throws -> Bool {
        return pigeonInstance.isAutoCancelEnabled
    }
    
    class MeteringPointTupleDelegate: PigeonApiDelegateMeteringPointTupleApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiMeteringPointTupleApi, point: MeteringPoint, modes: [MeteringModeApi]?) throws -> MeteringPointTuple {
            return MeteringPointTuple(point, modes?.map { $0.delegate })
        }
    }
    
    class DurationTupleDelegate: PigeonApiDelegateDurationTupleApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiDurationTupleApi, duration: Int64, timeUnit: TimeUnitApi) throws -> DurationTuple {
            return DurationTuple(duration, timeUnit.delegate)
        }
    }
}

class MeteringPointTuple: NSObject {
    let point: MeteringPoint
    let modes: [MeteringMode]?
    
    init(_ point: MeteringPoint, _ mode: [MeteringMode]?) {
        self.point = point
        self.modes = mode
    }
}

class DurationTuple: NSObject {
    let duration: Int64
    let timeUnit: TimeUnit
    
    init(_ duration: Int64, _ timeUnit: TimeUnit) {
        self.duration = duration
        self.timeUnit = timeUnit
    }
}

extension MeteringModeApi {
    var delegate: MeteringMode {
        switch self {
        case .af:
            return .af
        case .ae:
            return .ae
        case .awb:
            return .awb
        }
    }
}

extension TimeUnitApi {
    var delegate: TimeUnit {
        switch self {
        case .days:
            return .days
        case .hours:
            return .hours
        case .minutes:
            return .minutes
        case .seconds:
            return .seconds
        case .milliseconds:
            return .milliseconds
        case .microseconds:
            return .microseconds
        case .nanoseconds:
            return .nanoseconds
        }
    }
}
