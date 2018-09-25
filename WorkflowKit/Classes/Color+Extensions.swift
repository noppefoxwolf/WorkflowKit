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
  
  convenience init(hex: String, alpha: CGFloat) {
    let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
    let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
    let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
    let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
    self.init(red: r, green: g, blue: b, alpha: alpha)
  }
  
  convenience init(hex: String) {
    self.init(hex: hex, alpha: 1.0)
  }
  
  var light: Color {
    let ratio: CGFloat = 1.1
    return brightness(ratio: ratio)
  }
  
  var dark: Color {
    let ratio: CGFloat = 0.8
    return brightness(ratio: ratio)
  }
  
  private func brightness(ratio: CGFloat) -> Color {
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0
    getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
    return Color(hue: hue, saturation: saturation, brightness: brightness * ratio, alpha: alpha)
  }
}

enum PresetColor: Int64 {
  case red = 4282601983// #B4252E
  case orangered = 4251333119// #C93F15
  case orange = 4271458815// #D16307
  case yellow = 4274264319// #D88A03
  case green = 4292093695// #55992F
  case lime = 431817727// #3AA090
  case aqua = 1440408063// #3996BF
  case skyblue = 463140863// #3176D9
  case blue = 946986751// #1648B5
  case purple = 2071128575// #4927B3
  case violet = 3679049983// #7719A6
  case pink = 3980825855// #C03A7D
  case dark = 255// #55575B
  case gold = 3031607807// #807E6F
  case silder = 2846468607// #737B8F
  
  var applicationColor: UIColor {
    switch self {
    case .red: return .init(hex: "B4252E")
    case .orangered: return .init(hex: "C93F15")
    case .orange: return .init(hex: "D16307")
    case .yellow: return .init(hex: "D88A03")
    case .green: return .init(hex: "55992F")
    case .lime: return .init(hex: "3AA090")
    case .aqua: return .init(hex: "3996BF")
    case .skyblue: return .init(hex: "3176D9")
    case .blue: return .init(hex: "1648B5")
    case .purple: return .init(hex: "4927B3")
    case .violet: return .init(hex: "7719A6")
    case .pink: return .init(hex: "C03A7D")
    case .dark: return .init(hex: "55575B")
    case .gold: return .init(hex: "807E6F")
    case .silder: return .init(hex: "737B8F")
    }
  }
}


