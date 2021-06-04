import Foundation

struct NewsItem: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var date: String
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case id = "nid"
        case date, title, body
    }
}
