import Combine
import Foundation

protocol NewsService {
    func fetchNewsItems() -> AnyPublisher<[NewsItem], Never>
}

class GalnetNewsWebService: NewsService {
    private let url = URL(string: "https://www.alpha-orbital.com/galnet-feed")!
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchNewsItems() -> AnyPublisher<[NewsItem], Never> {
        urlSession.dataTaskPublisher(for: url)
            .print()
            .retry(2) //timeout also
            .receive(on: DispatchQueue.global())
            .map(\.data)
            .decode(type: [NewsItem].self, decoder: JSONDecoder())
            .handleEvents(receiveSubscription: {print($0)}, receiveOutput: {print($0)}, receiveCompletion: {print($0)})
            .replaceError(with: [NewsItem(title: "title", date: "date", content: "content")])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

