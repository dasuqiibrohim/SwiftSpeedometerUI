//
//  SubmitTextForm.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

struct SubmitTextForm: View {
    @State private var inputText: String = ""
    let onTapSubmit: (String) -> Void

    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter something...", text: $inputText)
                .font(.headline1)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                onTapSubmit(inputText)
            } label: {
                Text("Submit")
                    .font(.headline6)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.baseBlue)
                    .foregroundColor(.baseWhite)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
