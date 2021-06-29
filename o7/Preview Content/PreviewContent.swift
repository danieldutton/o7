import Combine
import Foundation

let preview_newsItem = NewsItem(
    id: UUID().uuidString, title: "This is Preview Data",
    date: "09 JUN 3306",
    content: "The nanomedicines developed in December 3304 by Vitadyne Labs have been approved for distrobution to medical facilities across the galaxy far and wide"
)

func previewNewsItems() -> AnyPublisher<[NewsItem], Never> {
    Just(Bundle.main.url(forResource: "sample_news", withExtension: "json")!)
        .tryMap { try Data(contentsOf: $0)}
        .decode(type: [NewsItem].self, decoder: JSONDecoder())
        .replaceError(with: [NewsItem(id: "1", title: "Preview Error", date: "", content: "content")])
        .map { HTMLNewsSanitiser().sanitise($0)}
        .eraseToAnyPublisher()

}
