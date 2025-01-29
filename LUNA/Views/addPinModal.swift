//
//  addPinModal.swift
//  LUNA
//
//  Created by Ivan Montes on 10/16/24.
//
import Foundation
import SwiftUI
import MapKit

struct addPinModal: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        VStack {
            HStack {
                Text("add pin")
                    .font(.title)
                
                
                Spacer()
                Button("X") {
                    dismiss()
                }
                .foregroundStyle(Color.gray)
            }.padding(.bottom, 20)
            HStack {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.headline)
                    TextField(" title", text: $appState.currentPin.title)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 2)
                    
                    Text("description")
                        .font(.headline)
                    TextField(" description", text: $appState.currentPin.description)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 2)
                }
                Spacer()
            }
            Spacer()
            Button(action: {
                appState.currentPin.coordinate.latitude = appState.centerCoordinate.latitude
                appState.currentPin.coordinate.longitude = appState.centerCoordinate.longitude
//                appState.currentPin.coordinate = appState.centerCoordinate
                print("\(appState.currentPin)")
                dismiss()
            }) {
                Text("submit")
            }
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//#Preview {
//    addPinModal()
//}
