//
//  GradientLayerFactory.swift
//  WorkflowKit
//
//  Created by Tomoya Hirano on 2018/09/25.
//

import Foundation

public struct GradientLayerFactory {
  public static func make(from color: Color) -> CAGradientLayer {
    let layer = CAGradientLayer()
    layer.colors = [color.cgColor, color.light.cgColor]
    layer.startPoint = .init(x: 1, y: 1)
    layer.endPoint = .init(x: -1, y: -1)
    layer.type = .radial
    return layer
  }
}
