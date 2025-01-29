import Foundation
import MapKit

struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
}

struct PinData: Identifiable {
    var id: Int
    var title: String
    var description: String
    var mediaUrls: [String] = []
    var coordinate: Coordinate
    var creationDate: Date
    var userID: Int
}

let dummyPins: [PinData] = [
    PinData(id: 1, title: "Sunset at the Beach", description: "A beautiful sunset over the ocean.", mediaUrls: ["https://example.com/photo1.jpg"], coordinate: Coordinate(latitude: 32.6514, longitude: -161.4333), creationDate: Date(), userID: 100),
    PinData(id: 2, title: "Mountain Hike", description: "Reached the summit!", mediaUrls: ["https://example.com/photo2.jpg"], coordinate: Coordinate(latitude: 37.7749, longitude: -122.4194), creationDate: Date(), userID: 100),
    PinData(id: 3, title: "City Lights", description: "Stunning view of the city at night.", mediaUrls: ["https://example.com/photo3.jpg"], coordinate: Coordinate(latitude: 40.7128, longitude: -74.0060), creationDate: Date(), userID: 100),
    PinData(id: 4, title: "Forest Trail", description: "Quiet and peaceful walk through the woods.", mediaUrls: ["https://example.com/photo4.jpg"], coordinate: Coordinate(latitude: 47.6062, longitude: -122.3321), creationDate: Date(), userID: 100),
    PinData(id: 5, title: "Desert Adventure", description: "Exploring the vast desert landscape.", mediaUrls: ["https://example.com/photo5.jpg"], coordinate: Coordinate(latitude: 36.1699, longitude: -115.1398), creationDate: Date(), userID: 100)
]
