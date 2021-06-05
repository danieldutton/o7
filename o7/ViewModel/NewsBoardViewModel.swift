import Combine
import Foundation
import SwiftUI

class NewsBoardViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var newsItems: [NewsItem] = []
    
    init() {
        loadNewsBoard()
    }
    
    func loadNewsBoard() {
        Just(Bundle.main.url(forResource: "sample_news", withExtension: "json")!)
            .tryMap { try Data(contentsOf: $0)}
            .decode(type: [NewsItem].self, decoder: JSONDecoder())
            .replaceError(with: [NewsItem(date: "", title: "Preview Error", body: "")])
            .assign(to: \.newsItems, on: self)
            .store(in: &subscriptions)
    }
}
