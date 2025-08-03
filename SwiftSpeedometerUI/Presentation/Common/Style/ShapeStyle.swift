//
//  ShapeStyle.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

extension ShapeStyle where Self == LinearGradient {
    static var customLinearGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.baseGray,
                Color.baseBlack
            ]),
            startPoint: .center,
            endPoint: .bottomTrailing
        )
    }
}

extension ShapeStyle where Self == RadialGradient {
    static var customRadialGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.baseBlack,
                Color.baseLightGray
            ]),
            center: .center,
            startRadius: 0,
            endRadius: 20
        )
    }
}
