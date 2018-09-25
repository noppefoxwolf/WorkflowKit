//
//  Color+Extensions.swift
//  Pods-WorkflowKit_Example
//
//  Created by Tomoya Hirano on 2018/09/25.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias Color = UIColor
#else
import Cocoa
public typealias Color = NSColor
#endif


extension Color {
  convenience init(rgbaValue: Int64) {
    let r = CGFloat((rgbaValue & 0xFF000000) >> 24) / 255.0
    let g = CGFloat((rgbaValue & 0x00FF0000) >> 16) / 255.0
    let b = CGFloat((rgbaValue & 0x0000FF00) >> 8) / 255.0
    let a = CGFloat((rgbaValue & 0x000000FF)) / 255.0
    self.init(red: r, green: g, blue: b, alpha: a)
  }
}
