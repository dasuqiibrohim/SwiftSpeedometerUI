//
//  GaugeInnerEllipse.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct GaugeInnerEllipse: View {
    var body: some View {
        Circle()
            .fill(.customLinearGradient)
            .innerShadow()
    }
}
