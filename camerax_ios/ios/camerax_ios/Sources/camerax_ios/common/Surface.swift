//
//  Surface.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/10.
//

import Foundation

public class Surface: NSObject {
    public enum Rotation: Int {
        case rotation0, rotation90, rotation180, rotation270
    }
}

extension Surface.Rotation {
    var api: SurfaceRotationApi {
        switch self {
        case .rotation0:
            return .rotation0
        case .rotation90:
            return .rotation90
        case .rotation180:
            return .rotation180
        case .rotation270:
            return .rotation270
        }
    }
}
