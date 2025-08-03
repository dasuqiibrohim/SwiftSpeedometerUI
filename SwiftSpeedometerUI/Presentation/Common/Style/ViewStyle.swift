//
//  ViewStyle.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

extension View {
    func innerShadow(
        color: Color = .black.opacity(0.25),
        radius: CGFloat = 4,
        offsetY: CGFloat = 4
    ) -> some View {
        self.modifier(InnerShadowModifier(radius: radius, offsetY: offsetY, color: color))
    }
    func customShadow(
        color: Color = .black.opacity(0.5),
        radius: CGFloat = 4,
        x: CGFloat = 0,
        y: CGFloat = 2
    ) -> some View {
        self.shadow(color: color, radius: radius, x: x, y: y)
    }
}
