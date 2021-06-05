import XCTest

@testable import o7

class NewsItemTests: XCTestCase {
    
    func test_newsItem_serialization_and_deserialization() {
        let newsItem = NewsItem(date: "date", title: "title", body: "body.")
        let encoded = try! JSONEncoder().encode(newsItem)
        let decoded = try! JSONDecoder().decode(NewsItem.self, from: encoded)
        
        let expected = newsItem
        let actual = decoded
        
        XCTAssertEqual(expected, actual)
    }
}

