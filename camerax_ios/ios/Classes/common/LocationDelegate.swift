//
//  LocationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation
import CoreLocation

class LocationDelegate: PigeonApiDelegateLocationApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiLocationApi, latitude: Double, longitude: Double) throws -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func latitude(pigeonApi: PigeonApiLocationApi, pigeonInstance: CLLocation) throws -> Double {
        return pigeonInstance.coordinate.latitude
    }
    
    func longitude(pigeonApi: PigeonApiLocationApi, pigeonInstance: CLLocation) throws -> Double {
        return pigeonInstance.coordinate.longitude
    }
}
