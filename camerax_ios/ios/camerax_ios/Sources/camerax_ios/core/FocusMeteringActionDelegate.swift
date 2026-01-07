//
//  FocusMeteringActionDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class FocusMeteringActionDelegate: PigeonApiDelegateFocusMeteringActionProxyApi {
    class BuilderDelegate: PigeonApiDelegateFocusMeteringActionBuilderProxyApi {
        func new1(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, point: MeteringPoint) throws -> FocusMeteringAction.Builder {
            return FocusMeteringAction.Builder(point)
        }
        
        func new2(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, point: MeteringPoint, meteringModes: [FocusMeteringActionMeteringModeApi]) throws -> FocusMeteringAction.Builder {
            return FocusMeteringAction.Builder(point, meteringModes.map { $0.delegate })
        }
        
        func addPoint1(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, pigeonInstance: FocusMeteringAction.Builder, point: MeteringPoint) throws -> FocusMeteringAction.Builder {
            return pigeonInstance.addPoint(point)
        }
        
        func addPoint2(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, pigeonInstance: FocusMeteringAction.Builder, point: MeteringPoint, meteringModes: [FocusMeteringActionMeteringModeApi]) throws -> FocusMeteringAction.Builder {
            return pigeonInstance.addPoint(point, meteringModes.map { $0.delegate })
        }
        
        func disableAutoCancel(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, pigeonInstance: FocusMeteringAction.Builder) throws -> FocusMeteringAction.Builder {
            return pigeonInstance.disableAutoCancel()
        }
        
        func setAutoCancelDuration(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, pigeonInstance: FocusMeteringAction.Builder, duration: Int64, timeUnit: TimeUnitApi) throws -> FocusMeteringAction.Builder {
            return try pigeonInstance.setAutoCancelDuration(duration, timeUnit.delegate)
        }
        
        func build(pigeonApi: PigeonApiFocusMeteringActionBuilderProxyApi, pigeonInstance: FocusMeteringAction.Builder) throws -> FocusMeteringAction {
            return pigeonInstance.build()
        }
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
