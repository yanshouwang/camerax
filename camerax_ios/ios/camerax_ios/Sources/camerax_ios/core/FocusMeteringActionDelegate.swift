//
//  FocusMeteringActionDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class FocusMeteringActionDelegate: PigeonApiDelegateFocusMeteringActionProxyApi {
    func build(pigeonApi: PigeonApiFocusMeteringActionProxyApi, point: MeteringPointTuple, morePoints: [MeteringPointTuple]?, disableAutoCancel: Bool?, autoCancelDuration: DurationTuple?) throws -> FocusMeteringAction {
        let builder = if let modes = point.modes { FocusMeteringAction.Builder(point.point, modes) }
        else { FocusMeteringAction.Builder(point.point) }
        if let morePoints {
            for morePoint in morePoints {
                _ = if let modes = morePoint.modes { builder.addPoint(morePoint.point, modes) }
                else { builder.addPoint(morePoint.point) }
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
    
    func getAutoCancelDurationInMillis(pigeonApi: PigeonApiFocusMeteringActionProxyApi, pigeonInstance: FocusMeteringAction) throws -> Int64 {
        return pigeonInstance.autoCancelDurationInMillis
    }
    
    func getMeteringPointsAe(pigeonApi: PigeonApiFocusMeteringActionProxyApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAe
    }
    
    func getMeteringPointsAf(pigeonApi: PigeonApiFocusMeteringActionProxyApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAf
    }
    
    func getMeteringPointsAwb(pigeonApi: PigeonApiFocusMeteringActionProxyApi, pigeonInstance: FocusMeteringAction) throws -> [MeteringPoint] {
        return pigeonInstance.meteringPointsAwb
    }
    
    func isAutoCancelEnabled(pigeonApi: PigeonApiFocusMeteringActionProxyApi, pigeonInstance: FocusMeteringAction) throws -> Bool {
        return pigeonInstance.isAutoCancelEnabled
    }
}

extension FocusMeteringActionMeteringModeApi {
    var delegate: FocusMeteringAction.MeteringMode {
        return switch self {
        case .af: .af
        case .ae: .ae
        case .awb: .awb
        }
    }
}
