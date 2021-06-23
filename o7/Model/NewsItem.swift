import Foundation

struct NewsItem: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var title: String
    var date: String
    var content: String
}
