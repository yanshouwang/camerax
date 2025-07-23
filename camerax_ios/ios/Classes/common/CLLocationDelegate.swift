//
//  CLLocationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation
import CoreLocation

class CLLocationDelegate: PigeonApiDelegateCLLocationApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCLLocationApi, latitude: Double, longitude: Double) throws -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func latitude(pigeonApi: PigeonApiCLLocationApi, pigeonInstance: CLLocation) throws -> Double {
        return pigeonInstance.coordinate.latitude
    }
    
    func longitude(pigeonApi: PigeonApiCLLocationApi, pigeonInstance: CLLocation) throws -> Double {
        return pigeonInstance.coordinate.longitude
    }
}
