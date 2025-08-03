//
//  ContentView.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 02/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var angle = -18.0
    @State private var valueProgress = 0.4
    
    var body: some View {
        VStack(spacing: 48)  {
            ZStack {
                SpeedometerFace()
                
                GaugeArc(value: valueProgress)
                
                GaugeNeedle(angle: angle)
            }
            .overlay(alignment: .bottom) {
                Text("25k")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.baseBlue)
                    .padding(48)
            }
            
            
            SubmitTextForm(
                onTapSubmit: { value in
                    guard let updValue = Int(value) else { return }
                    withAnimation(.easeInOut(duration: 0.9)) {
                        angle = interpolatedAngle(for: updValue)
                        valueProgress = progressTrim(for: Double(updValue))
                    }
                }
            )
        }
    }
    
    func interpolatedAngle(for input: Int) -> Double {
        /*
         0 -> -18
         1k -> 18
         5k -> 54
         10k -> 90
         25k -> 126
         50k -> 162
         100k+ -> 198
         */
        let ranges: [(input: Int, degree: Double)] = [
            (0, -18),
            (1_000, 18),
            (5_000, 54),
            (10_000, 90),
            (25_000, 126),
            (50_000, 162),
            (100_000, 198)
        ]
        
        for i in 0..<ranges.count - 1 {
            let lower = ranges[i]
            let upper = ranges[i + 1]
            
            if input >= lower.input && input < upper.input {
                let proportion = Double(input - lower.input) / Double(upper.input - lower.input)
                return lower.degree + proportion * (upper.degree - lower.degree)
            }
        }
        
        return 198 // for 100k+
    }
    func progressTrim(for input: Double) -> Double {
        /*
         0     -> 0.4
         1k    -> 0.5
         5k    -> 0.6
         10k   -> 0.7
         25k   -> 0.8
         50k   -> 0.9
         100k+ -> 1
         */
        let ranges: [(limit: Double, value: Double)] = [
            (0, 0.4),
            (1_000, 0.5),
            (5_000, 0.6),
            (10_000, 0.7),
            (25_000, 0.8),
            (50_000, 0.9),
            (100_000, 1.0)
        ]
        
        guard input >= 0 else { return 0.0 }
        if input >= 100_000 { return 1.0 }
        
        for i in 0..<ranges.count - 1 {
            let current = ranges[i]
            let next = ranges[i + 1]
            
            if input >= current.limit && input < next.limit {
                let fraction = (input - current.limit) / (next.limit - current.limit)
                return current.value + fraction * (next.value - current.value)
            }
        }
        return 1.0
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
