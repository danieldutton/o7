import Combine
import Foundation
import SwiftUI

class NewsBoardViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    private var newsService: NewsService
    private var newsSanitiser: NewsSanitiser
    
    @Published var newsItems: [NewsItem] = []
    @Published var isPerformingWork = false
    
    
    init(newsService: NewsService = GalnetNewsWebService(),
         newsSanitiser: NewsSanitiser = HTMLNewsSanitiser()) {
        
        self.newsService = newsService
        self.newsSanitiser = newsSanitiser
        
        loadNewsBoard()
    }
    
    func loadNewsBoard() {
        
        newsService.fetchNewsItems()
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveRequest: { _ in self.isPerformingWork = true })
            .map { $0.newsItems}
            .map { self.newsSanitiser.sanitise($0)}
            .handleEvents(receiveOutput: { _ in self.isPerformingWork = false })
            .assign(to: \.newsItems, on: self)
            .store(in: &subscriptions)
        
    }
}
