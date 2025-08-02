//
//  ContentView.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 02/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            OuterEllipse()
                .frame(width: 328, height: 328)
            InnerEllipse()
                .frame(width: 308, height: 308)
            
            SpeedDial()
                .frame(width: 62, height: 62)
        }
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
            //gradient: Gradient(stops: [
            gradient: Gradient(colors: [
                //.init(color: Color.baseBlack, location: 0.8),
                //.init(color: Color.baseLightGray, location: 1.0)
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
