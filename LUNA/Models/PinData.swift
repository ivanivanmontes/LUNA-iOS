import Foundation
import MapKit

struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
}

struct PinData: Identifiable, Codable {
    var id: Int
    var title: String
    var details: String
    var mediaUrls: [String] = []
    var coordinate: Coordinate
    var creationDate: Date
    var userID: Int
    
}

extension PinData {
    func toBackendSchema() -> [String: Any] {
        return [
            "latitude": self.coordinate.latitude,
            "longitude": self.coordinate.longitude,
            "title": self.title,
            "details": self.details,
            "user_id": self.userID
        ]
    }
}
