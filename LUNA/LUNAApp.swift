
import SwiftUI

@main
struct LUNAApp: App {
    @StateObject var appState = AppState()
    @StateObject private var userViewModel = UserViewModel()
    var body: some Scene {
        WindowGroup {
            customTabBar()
                .environmentObject(appState)
                .environmentObject(userViewModel)
                
            
        }
    }
}
