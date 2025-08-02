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
                OuterEllipse()
                
                Circle()
                    .trim(from: 0.4, to: valueProgress)
                    .stroke(
                        Color.baseBlue,
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .rotationEffect(.degrees(18))
                    .frame(width: 318, height: 318)
                
                InnerEllipse()
                    .frame(width: 308, height: 308)
                
                SpeedDial()
                    .frame(width: 62, height: 62)
                
                HStack {
                    Capsule()
                        .frame(width: 100, height: 5)
                        .foregroundColor(.baseBlue)
                    Capsule()
                        .frame(width: 100, height: 5)
                        .foregroundColor(.clear)
                }
                .rotationEffect(.degrees(angle))
                
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
                .foregroundColor(.baseBlue)
                .padding()
                
            }
            .frame(width: 328, height: 328)
            FormView(
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


struct SpeedDial: View {
    var body: some View {
        Circle()
            .fill(Color.baseBlack)
            .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
    }
}
struct OuterEllipse: View {
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.baseBlack,
                Color.baseLightGray
            ]),
            center: .center,
            startRadius: 0,
            endRadius: 20
        )
        .clipShape(Circle())
    }
}
struct InnerEllipse: View {
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.baseGray,
                        Color.baseBlack
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                Circle()
                    .stroke(Color.black.opacity(0.25), lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 0, y: 4)
                    .mask(
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.black, .clear],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
            )
    }
}
struct FormView: View {
    @State private var inputText: String = ""
    let onTapSubmit: (String) -> Void

    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter something", text: $inputText)
                .font(.system(size: 20, weight: .semibold))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                print("Submitted: \(inputText)")
                onTapSubmit(inputText)
            } label: {
                Text("Submit")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    func angleForInput(_ input: Int) -> Double {
        switch input {
        case ..<1_000:
            return -18
        case 1_000..<5_000:
            return 18
        case 5_000..<10_000:
            return 54
        case 10_000..<25_000:
            return 90
        case 25_000..<50_000:
            return 126
        case 50_000..<100_000:
            return 162
        default:
            return 198
        }
    }
}
struct CircularProgressView: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.blue, .green]),
                        center: .center),
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut(duration: 0.5), value: progress)
        }
        .frame(width: 318, height: 318)
    }
}
