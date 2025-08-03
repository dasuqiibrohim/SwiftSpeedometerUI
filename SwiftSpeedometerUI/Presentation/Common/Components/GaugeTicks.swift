//
//  GaugeTicks.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct GaugeTicks: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("10k")
            HStack {
                Text("5k")
                Spacer()
                Text("25k")
            }
            .padding(.horizontal, 54)
            HStack {
                Text("1k")
                Spacer()
                Text("50k")
            }
            .padding(.horizontal, 8)
            .padding(.top, 42)
            HStack {
                Text("0")
                Spacer()
                Text("100K")
            }
            .padding(.horizontal, 12)
            .padding(.top, 60)
            Spacer()
        }
        .font(.headline6)
        .foregroundColor(.baseWhite)
        .padding()
    }
}
