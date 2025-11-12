//
//  ErrorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/23.
//

import Foundation
import Flutter

func wrap(_ error: Any) -> [Any?] {
  if let pigeonError = error as? CameraXError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}
