
import Combine
import Foundation

class UserViewModel: ObservableObject {
    @Published var userData: UserData?
    @Published var userPins: [PinData]?
    
    private var isUserDataLoaded = false
    private var isPinDataLoaded = false
    
    func fetchUserData(userId: Int) {
        guard !isUserDataLoaded else { return } // Prevent multiple calls
        isUserDataLoaded = true
        
        guard let url = URL(string: "http://127.0.0.1:8000/get_user/\(userId)") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("We got an error: \(error)")
            }
            guard let data = data else {
                print("data was not received???")
                return
            }
            
            do {
                if let JSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    DispatchQueue.main.async {
                        if self.userData == nil {
                            self.userData = UserData(id: 0, username: "", firstName: "", lastName: "", email: "", partnershipID: 0, isLoggedIn: false)
                        }
                        print("only do this once")
                        self.userData?.id = JSON["user_id"] as? Int
                        self.userData?.username = JSON["username"] as? String
                        self.userData?.firstName = JSON["first_name"] as? String
                        self.userData?.partnershipID = JSON["partnership_id"] as? Int
                        self.userData?.email = JSON["email"] as? String
                    }
                }
                
            } catch {
                print("error parsing JSON: \(error)")
            }
            
        }
        
        /// start the task
        task.resume()
        
        
    }
    
    func fetchUserPins(userId: Int) {
        guard !isPinDataLoaded else { return }
        isPinDataLoaded = true
        
        guard let url = URL(string: "http://127.0.0.1:8000/get_all_pins/\(userId)")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("We got an error: \(error)")
            }
            
            guard let data = data else {
                return
            }
            
            do {
                // Parse the JSON response into an array of dictionaries
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    
                    DispatchQueue.main.async {
                        
                        // Map the JSON dictionaries to PinData objects
                        let pins = jsonArray.compactMap { dict -> PinData? in
                            guard
                                let id = dict["pin_id"] as? Int,
                                let title = dict["title"] as? String,
                                let description = dict["details"] as? String,
                                let coordinate = Coordinate(latitude: 34.0113, longitude: -118.4921) as? Coordinate,
                                let creationDate = Date() as? Date
                            else { return nil }
                            
                            return PinData(id: id, title: title, description: description, mediaUrls: [], coordinate: coordinate, creationDate: creationDate, userID: userId)
                        }
                        self.userPins = pins
//                        print("\(self.userPins.?.first?.description ?? "No Pins")")
                    }
                }
                
            } catch {
                print("error parsing JSON: \(error)")
            }
            
            
            
            
            
        }
        
        task.resume()
    }
    
}
