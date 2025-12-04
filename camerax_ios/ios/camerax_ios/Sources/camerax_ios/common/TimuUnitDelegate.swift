//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/10.
//

import Foundation

extension TimeUnitApi {
    var delegate: TimeUnit {
        return switch self {
        case .days: .days
        case .hours: .hours
        case .minutes: .minutes
        case .seconds: .seconds
        case .milliseconds: .milliseconds
        case .microseconds: .microseconds
        case .nanoseconds: .nanoseconds
        }
    }
}
