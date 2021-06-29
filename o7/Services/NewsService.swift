import Combine
import Foundation

protocol NewsService {
    func fetchNewsItems() -> AnyPublisher<GalnetNews, Never>
}

class GalnetNewsWebService: NewsService {
    //https://cms.zaonce.net/en-GB/jsonapi/node/galnet_article?sort=-created 
    private let url = URL(string: "https://cms.zaonce.net/en-GB/jsonapi/node/galnet_article?sort=-created")!
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchNewsItems() -> AnyPublisher<GalnetNews, Never> {
        urlSession.dataTaskPublisher(for: url)
            .print()
            .retry(2) //timeout also
            .receive(on: DispatchQueue.global())
            .map(\.data)
            .decode(type: GalnetNews.self, decoder: JSONDecoder())
            .handleEvents(receiveSubscription: {print($0)}, receiveOutput: {print($0)}, receiveCompletion: {print($0)})
            .replaceError(with: GalnetNews(data: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

