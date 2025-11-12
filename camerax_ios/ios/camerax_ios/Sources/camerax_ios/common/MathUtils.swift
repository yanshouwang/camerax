//
//  MathUtils.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class MathUtils {
    private init() {}
    
    /// This method takes a numerical value and ensures it fits in a given numerical range. If the
    /// number is smaller than the minimum required by the range, then the minimum of the range will
    /// be returned. If the number is higher than the maximum allowed by the range then the maximum
    /// of the range will be returned.
    /// - Parameters:
    ///   - value: the value to be clamped.
    ///   - min: minimum resulting value.
    ///   - max: maximum resulting value.
    /// - Returns: the clamped value.
    public static func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        if value < min {
            return min
        }
        if value > max {
            return max
        }
        return value
    }
}
