import Combine
import Foundation
import SwiftUI

class NewsBoardViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    private var newsService: NewsService
    private var newsSanitiser: NewsSanitiser
    @Published var newsItems: [NewsItem] = []
    
    init(newsService: NewsService = GalnetNewsWebService(),
         newsSanitiser: NewsSanitiser = HTMLNewsSanitiser()) {
        self.newsService = newsService
        self.newsSanitiser = newsSanitiser
        
        loadNewsBoard()
    }
    
    func loadNewsBoard() {
        Just(Bundle.main.url(forResource: "sample_news", withExtension: "json")!)
            .tryMap { try Data(contentsOf: $0)}
            .decode(type: [NewsItem].self, decoder: JSONDecoder())
            .replaceError(with: [NewsItem(date: "", title: "Preview Error", body: "")])
            .map { self.newsSanitiser.sanitise($0)}
            .assign(to: \.newsItems, on: self)
            .store(in: &subscriptions)
         
        
        /*
        newsService.fetchNewsItems()
            .assign(to: \.newsItems, on: self)
            .store(in: &subscriptions)
 */
    }
}
