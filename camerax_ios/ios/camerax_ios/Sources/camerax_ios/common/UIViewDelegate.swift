//
//  ViewDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2026/7/10.
//

import Foundation

class UIViewDelegate: PigeonApiDelegateUIViewProxyApi {
    func getAlpha(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView) throws -> Double {
        return pigeonInstance.alpha
    }
    
    func setAlpha(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView, value: Double) throws {
        pigeonInstance.alpha = value
    }
    
    func isHidden(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView) throws -> Bool {
        return pigeonInstance.isHidden
    }
    
    func isOpaque(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView) throws -> Bool {
        return pigeonInstance.isOpaque
    }
    
    func setHidden(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView, value: Bool) throws {
        pigeonInstance.isHidden = value
    }
    
    func setOpaque(pigeonApi: PigeonApiUIViewProxyApi, pigeonInstance: UIView, value: Bool) throws {
        pigeonInstance.isOpaque = value
    }
}
