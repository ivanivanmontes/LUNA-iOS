
enum MemoryType: String, Codable {
    case text
    case photo
    case video
    case audio
}

struct MemoryData: Codable, Identifiable {
    var id: Int
    var instanceID: Int
    var pinID: Int
    var memoryType: MemoryType
    var text: String?
    var mediaUrls: [String]
}
