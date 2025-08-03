//
//  GaugeArc.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct GaugeArc: View {
    let value: Double
    
    var body: some View {
        Circle()
            .trim(from: 0.4, to: value)
            .stroke(
                Color.baseBlue,
                style: StrokeStyle(lineWidth: 10, lineCap: .round)
            )
            .rotationEffect(.degrees(18))
            .frame(width: 318, height: 318)
    }
}
