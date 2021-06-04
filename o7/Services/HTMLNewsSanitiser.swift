import Foundation

protocol NewsSanitiser {
    func sanitise(_ newsItems: [NewsItem]) -> [NewsItem]
}

class HTMLNewsSanitiser: NewsSanitiser {
    
    func sanitise(_ newsItems: [NewsItem]) -> [NewsItem] {
        var copyNewsItems = newsItems
        
        copyNewsItems.indices.forEach {
            let breaklined =
                copyNewsItems[$0].body.replacingOccurrences(of: "<br />", with: "\n")
            
            copyNewsItems[$0].body =
                breaklined.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
        return copyNewsItems
    }
}
