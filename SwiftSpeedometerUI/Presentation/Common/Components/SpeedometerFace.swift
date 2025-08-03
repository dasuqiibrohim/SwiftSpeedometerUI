//
//  SpeedometerFace.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct SpeedometerFace: View {
    var body: some View {
        ZStack {
            GaugeOuterEllipse()
            
            GaugeInnerEllipse()
                .frame(width: 308, height: 308)
            
            GaugeSpeedDial()
                .frame(width: 62, height: 62)
            
            GaugeTicks()
            
        }
        .frame(width: 328, height: 328)
    }
}
