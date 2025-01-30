//
//  pinDetailView.swift
//  LUNA
//
//  Created by Ivan Montes on 10/15/24.
//

import SwiftUI

struct pinDetailView: View {
    let pin: PinData
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(pin.title)
                .font(.largeTitle)
                .bold()
            Text(pin.details)
                .font(.body)
            
            Text("Coordinates: \(pin.coordinate.latitude), \(pin.coordinate.longitude)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("User ID: \(pin.userID)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Created on \(pin.creationDate.formatted(.dateTime))")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
    }
}
