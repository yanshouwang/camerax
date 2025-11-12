//
//  TupleDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/10.
//

import Foundation

class DurationTupleDelegate: PigeonApiDelegateDurationTupleProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiDurationTupleProxyApi, duration: Int64, timeUnit: TimeUnitApi) throws -> DurationTuple {
        return DurationTuple(duration, timeUnit.delegate)
    }
}

class MeteringPointTupleDelegate: PigeonApiDelegateMeteringPointTupleProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiMeteringPointTupleProxyApi, point: MeteringPoint, modes: [FocusMeteringActionMeteringModeApi]?) throws -> MeteringPointTuple {
        return MeteringPointTuple(point, modes?.map { $0.delegate })
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

class MeteringPointTuple: NSObject {
    let point: MeteringPoint
    let modes: [FocusMeteringAction.MeteringMode]?
    
    init(_ point: MeteringPoint, _ mode: [FocusMeteringAction.MeteringMode]?) {
        self.point = point
        self.modes = mode
    }
}
