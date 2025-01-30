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
    @EnvironmentObject var userViewModel : UserViewModel
    @EnvironmentObject var pinViewModel: PinViewModel
    
    
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
                    TextField(" description", text: $appState.currentPin.details)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 2)
                }
                Spacer()
            }
            Spacer()
            Button(action: {
                /// idk if i need to set this up as the current pin...
                appState.currentPin.coordinate.latitude = appState.centerCoordinate.latitude
                appState.currentPin.coordinate.longitude = appState.centerCoordinate.longitude
                print("\(appState.currentPin)")
                
                ///i do NOT like the way we're doing this. id and date fields are not used when adding a pin. userID is forced wrapped...
                let newPin = PinData(id: 0, title: appState.currentPin.title, details: appState.currentPin.details, coordinate: Coordinate(latitude: appState.currentPin.coordinate.latitude, longitude: appState.currentPin.coordinate.longitude), creationDate: Date(), userID: userViewModel.userData!.id!)
                pinViewModel.addPin(pin: newPin)
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
