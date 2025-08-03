//
//  InnerShadowModifier.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct InnerShadowModifier: ViewModifier {
    var radius: CGFloat = 4
    var offsetY: CGFloat = 4
    var color: Color = Color.black.opacity(0.25)
    
    func body(content: Content) -> some View {
        content
            .overlay(
                content
                    .mask(
                        content
                            .blur(radius: radius)
                            .offset(x: 0, y: offsetY)
                    )
                    .blendMode(.multiply)
                    .foregroundColor(color)
            )
    }
}
