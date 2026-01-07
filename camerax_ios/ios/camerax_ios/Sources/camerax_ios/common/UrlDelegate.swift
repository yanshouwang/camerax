//
//  UrlDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Foundation

extension String {
    var urlDelegate: URL {
        return URL(fileURLWithPath: self)
    }
    
    var urlDelegateOrNil: URL? {
        return URL(string: self)
    }
}
