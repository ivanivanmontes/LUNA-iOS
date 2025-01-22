//
//  TabBar.swift
//  LUNA
//
//  Created by Ivan Montes on 10/14/24.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Int
    @EnvironmentObject var appState: AppState
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedTab = 0
            }) {
                VStack {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .font(.title)
                }
            }
            Spacer()
            Button(action: {
                selectedTab = 1
            }) {
                VStack {
                    Image(systemName: selectedTab == 1 ? "mappin.and.ellipse" : "mappin.and.ellipse")
                        .font(.title)
                }
            }
            Spacer()
            Button(action: {
                selectedTab = 2
                (appState.modalOpen ? nil : appState.modalOpen.toggle()) // change to true only when it was previously false
            }) {
                VStack {
                    addPinButton()
                        .frame(width: 50 , height: 50)
                }

            }
            Spacer()
            Button(action: {
                selectedTab = 3
            }) {
                VStack {
                    Image(systemName: selectedTab == 3 ? "person.crop.circle.fill" : "person.crop.circle")
                        .font(.title)
                }
            }
            Spacer()
            Button(action: {
                selectedTab = 4
                
                (appState.modalOpen ? appState.modalOpen.toggle() : nil) // TODO: change later
            }) {
                VStack {
                    Image(systemName: selectedTab == 4 ? "gear" : "gear")
                        .font(.title)
                }
            }
            Spacer()
            
        }
        
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct CustomCircle_Previews: PreviewProvider {
    @State static var sampleCount: Int = 0 // Sample value for binding
    static let appState = AppState()


    static var previews: some View {
        
        TabBar(selectedTab: $sampleCount).environmentObject(appState)
    }
}
