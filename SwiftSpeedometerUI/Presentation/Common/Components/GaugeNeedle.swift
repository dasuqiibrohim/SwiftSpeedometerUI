//
//  GaugeNeedle.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct GaugeNeedle: View {
    let angle: Double
    
    var body: some View {
        HStack {
            Capsule()
                .frame(width: 100, height: 5)
                .foregroundColor(.baseBlue)
            Capsule()
                .frame(width: 100, height: 5)
                .foregroundColor(.clear)
        }
        .rotationEffect(.degrees(angle))
    }
}
