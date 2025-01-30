import Foundation
import SwiftUICore
import Combine
import MapKit

class PinViewModel: ObservableObject {
    
    func addPin(pin: PinData) {
        guard let url = URL(
            string: "http://luna-backend-production-0459.up.railway.app/create_pin/\(pin.userID)"
        )
        else { return }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: pin.toBackendSchema()) else {
            print("Failed to encode backend payload to JSON")
            return
        }
                
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Send the request
        URLSession.shared.dataTask(with: request) {
            data,
            response,
            error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Check the response
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }

            // Handle the response data
            if let data = data,
               let responseString = String(
                data: data,
                encoding: .utf8
               ) {
                print("Response: \(responseString)")
            }
        }.resume()
        
        
        
    }
    
}
