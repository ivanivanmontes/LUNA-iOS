
import Combine
import Foundation
import MapKit

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
                        /// i wanna see if i dont need to do this
                        if self.userData == nil {
                            self.userData = UserData(id: 10, username: "", firstName: "", lastName: "", email: "", partnershipID: 0, isLoggedIn: false)
                        }
                        self.userData?.id = JSON["user_id"] as? Int
                        self.userData?.username = JSON["username"] as? String
                        self.userData?.firstName = JSON["first_name"] as? String
                        self.userData?.partnershipID = JSON["partnership_id"] as? Int
                        self.userData?.email = JSON["email"] as? String
                        print("fetching user data done")
                    }
                }
                
            } catch {
                print("error parsing JSON: \(error)")
            }
            
        }
        
        /// start the task
        task.resume()
        
        
    }
    
    func fetchUserPins() {
        guard !isPinDataLoaded, isUserDataLoaded else { return }
        isPinDataLoaded = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let url = URL(string: "http://127.0.0.1:8000/get_all_pins/\(self.userData?.id ?? 10)")
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
                                let coordinate =
                                    Coordinate(latitude: dict["latitude"] as! Double, longitude: dict["longitude"] as! Double) as? Coordinate,
                                let creationDate = dateFormatter.date(from: dict["creation_date"] as! String)
                            else { return nil }
                            return PinData(id: id, title: title, description: description, mediaUrls: [], coordinate: coordinate, creationDate: creationDate, userID: self.userData?.id ?? 10)
                        }
                        self.userPins = pins
                        print("fetching pins done")
                    }
                }
                
            } catch {
                print("error parsing JSON: \(error)")
            }
            
            
            
            
            
        }
        
        task.resume()
    }
    
}
