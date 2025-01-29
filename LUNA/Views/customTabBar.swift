//
//  customTabBar.swift
//  LUNA
//
//  Created by Ivan Montes on 10/14/24.
//

import SwiftUI

struct customTabBar: View {
    @State private var selectedTab = 0
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack() {
//            Spacer()
            switch selectedTab {
            case 0:
                homeView()
            case 1:
                pinListView()
            case 2: // add pin with modal
                homeView() //TODO: when the add pin button is pressed from the homeView, dont reload the homeView again,
            case 3:
                partnerView()
            case 4:
                settingsView()
            default:
                homeView()
            }
            
            VStack {
                Spacer()
                // custom tab bar
                TabBar(selectedTab: $selectedTab)
                    .shadow(color: Color.gray, radius: 8, x: 0, y: 8)
            }
            .sheet(isPresented: $appState.modalOpen) {
                // TODO: we're opening up the modal on the tab bar view to avoid animation issues on opening on homeView. don't know if this is a good work around.
                addPinModal()
                    .presentationDetents([.medium])
            }

                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let appState = AppState()
    
    
    static var previews: some View {
        customTabBar().environmentObject(appState)
    }
}
