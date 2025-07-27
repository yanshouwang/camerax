//
//  CMTimeDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/26.
//

import Foundation
import AVFoundation

extension CMTime {
    var api: Int64 {
        return self.isValid ? Int64(self.seconds * 1000) : 0
    }
}
