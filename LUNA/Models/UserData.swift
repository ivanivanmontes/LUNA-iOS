import Foundation

struct UserData: Codable {
    var id: Int?
    var username: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var partnershipID: Int?
    
    var isLoggedIn: Bool?
    
    enum CodingsKeys: String, CodingKey {
        case id = "user_id"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case partnershipID = "partnership_id"
    }

}

