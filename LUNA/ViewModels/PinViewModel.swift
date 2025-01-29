import Foundation
import Combine
import MapKit

class PinViewModel: ObservableObject {
    @Published var userData: UserData?
    
    
    
    func addPin() {
        //TODO: guard user id
        guard let url = URL(string: "http://127.0.0.1:8000/create_pin/\(self.userData?.id ?? 10)")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("We got an error: \(error)")
            }
            guard let data = data else { return }
            
            do {
                //TODO: add pin to the backend. come back to this later
            }
        }
    }
    
}
