//
//  DataDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/23.
//

import Foundation
import Flutter

extension Data {
    var api: FlutterStandardTypedData {
        return FlutterStandardTypedData(bytes: self)
    }
}
