
import SwiftUI

@main
struct LUNAApp: App {
    @StateObject var appState = AppState()
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var pinViewModel = PinViewModel()
    var body: some Scene {
        WindowGroup {
            customTabBar()
                .environmentObject(appState)
                .environmentObject(userViewModel)
                .environmentObject(pinViewModel)
                
            
        }
    }
}
