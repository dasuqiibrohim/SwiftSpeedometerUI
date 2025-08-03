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
}
