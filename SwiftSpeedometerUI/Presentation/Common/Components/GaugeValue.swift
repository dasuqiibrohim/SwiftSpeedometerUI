//
//  GaugeValue.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct GaugeValue: View {
    let valueDisplay: String
    
    var body: some View {
        Text(valueDisplay)
            .font(.headline1)
            .foregroundColor(.baseBlue)
            .padding(48)
    }
}
