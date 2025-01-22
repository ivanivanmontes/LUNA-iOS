//
//  tabBarView.swift
//  LUNA
//
//  Created by Ivan Montes on 10/12/24.
//

import SwiftUI
import Foundation

struct tabBarView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "tray.and.arrow.down.fill") {
                homeView()
            }
            
            Tab("Pins", systemImage: "tray.and.arrow.down.fill") {
                pinListView()
            }
            
            Tab("Add", systemImage: "tray.and.arrow.down.fill") {
                addPinView()
            }
            
            Tab("Partner", systemImage: "tray.and.arrow.down.fill") {
                partnerView()
            }
            
            Tab("Settings", systemImage: "tray.and.arrow.down.fill") {
                settingsView()
            }
        }
    }
}

#Preview {
    tabBarView()
}
