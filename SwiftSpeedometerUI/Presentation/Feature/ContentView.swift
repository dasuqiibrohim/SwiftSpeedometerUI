//
//  ContentView.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 02/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var angleDisplay = -18.0
    @State private var progressDisplay = 0.4
    @State private var valueDisplay: String = "0"
    
    var body: some View {
        VStack(spacing: 48)  {
            ZStack {
                SpeedometerFace()
                
                GaugeArc(value: progressDisplay)
                
                GaugeNeedle(angle: angleDisplay)
            }
            .overlay(alignment: .bottom) {
                GaugeValue(valueDisplay: valueDisplay)
            }
            
            SubmitTextForm(
                onTapSubmit: { value in
                    guard let updateValue = Int(value) else { return }
                    withAnimation(.easeInOut(duration: 0.9)) {
                        angleDisplay = interpolatedAngle(for: updateValue)
                        progressDisplay = progressTrim(for: Double(updateValue))
                        valueDisplay = formatToK(for: Double(updateValue))
                    }
                }
            )
        }
    }
}

// Function Calculate
extension ContentView {
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
        
        guard input > 0 else { return -18 }
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
        
        guard input > 0 else { return 0.4 }
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
    func formatToK(for input: Double) -> String {
        guard input > 0 else { return "0" }
        if input >= 100_000 {
            return "100K+"
        }
        let inK = input / 1000.0
        let rounded = (inK * 10).rounded() / 10  // 1 decimal

        if rounded == floor(rounded) {
            return String(format: "%.0fK", rounded)
        } else {
            return String(format: "%.1fK", rounded)
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
