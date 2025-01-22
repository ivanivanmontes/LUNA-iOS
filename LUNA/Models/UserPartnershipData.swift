import Foundation

struct UserPartnershipData: Codable {
    var id: Int
    var userID1: Int
    var userID2: Int
    var partnershipDate: Date
}
