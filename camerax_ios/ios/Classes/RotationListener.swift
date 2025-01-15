//
//  RotationListener.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/23.
//

import Foundation

class RotationListener: NSObject {
    internal let onRotationChanged: (Int) -> Void

    init(onRotationChanged: @escaping (Int) -> Void) {
        self.onRotationChanged = onRotationChanged
    }
}
