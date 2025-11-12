//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/10.
//

import Foundation

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
