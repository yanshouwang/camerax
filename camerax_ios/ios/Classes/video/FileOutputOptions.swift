//
//  FileOutputOptions.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

public class FileOutputOptions: NSObject {
    let duratioinLimitMills: Int?
    let fileSizeLimitBytes: Int?
    let location: CLLocation?
    
    init(duratioinLimitMills: Int?, fileSizeLimitBytes: Int?, location: CLLocation?) {
        self.duratioinLimitMills = duratioinLimitMills
        self.fileSizeLimitBytes = fileSizeLimitBytes
        self.location = location
    }
}
