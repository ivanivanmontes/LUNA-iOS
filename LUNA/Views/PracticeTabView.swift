import SwiftUI

struct PracticeTabView: View {
    @State private var testPins: [PinData] = [
        PinData(id: 1, title: "title", description: "description", mediaUrls: [""], coordinate: Coordinate(latitude: 10, longitude: 20), creationDate: Date.now, userID: 1),
        PinData(id: 2, title: "title", description: "description", mediaUrls: [""], coordinate: Coordinate(latitude: 10, longitude: 20), creationDate: Date.now, userID: 2)
    ]
    private var testUserData = UserData(id: 1, username: "yo_smite", firstName: "Ivan", lastName: "Montes", email: "lmaoasif@gmail.com", partnershipID: 1, isLoggedIn: true)
    var body: some View {
        TabView {
            FirstView(pins: testPins)
                .tabItem {
                    Label("First", systemImage: "1.square.fill")
                }
            
            NavigationView {
                FourthView(userData: testUserData)
                    
            }.tabItem {
                Label("ADD", systemImage: "2.square.fill")
            }
            
            NavigationView {  // Wrap ThirdView in NavigationView for NavigationLink
                ThirdView(userData: testUserData)
            }
            .tabItem {
                Label("Third", systemImage: "3.square.fill")
            }
            
            
        }
    }
}
