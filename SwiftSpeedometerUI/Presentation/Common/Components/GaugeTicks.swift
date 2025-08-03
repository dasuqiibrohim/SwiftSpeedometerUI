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
                .font(.system(size: 16, weight: .bold))
            HStack {
                Text("5k")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("25k")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 54)
            HStack {
                Text("1k")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("50k")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 8)
            .padding(.top, 42)
            HStack {
                Text("0")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("100K")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 12)
            .padding(.top, 60)
            Spacer()
        }
        .foregroundColor(.baseWhite)
        .padding()
    }
}
