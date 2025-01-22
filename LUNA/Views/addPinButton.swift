//
//  addPinButton.swift
//  LUNA
//
//  Created by Ivan Montes on 10/14/24.
//

import SwiftUI

struct addPinButton: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.blue)
                .overlay(
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundStyle(.white)
                )
        }
    }
}

#Preview {
    addPinButton()
}
