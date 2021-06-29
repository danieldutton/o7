import Foundation

struct NewsItem: Identifiable, Codable, Equatable {
    var id: String
    var title: String
    var date: String
    var content: String
    
}
