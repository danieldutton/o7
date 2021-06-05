import SwiftUI

struct NewsBoard: View {
    @StateObject var viewModel = NewsBoardViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.newsItems) { newsItem in
                VStack(alignment: .leading, spacing: 5) {
                    Text(newsItem.date)
                    Text(newsItem.title)
                        .font(.headline)
                        .lineLimit(0)
                        .truncationMode(.tail)
                    Text(newsItem.body)
                        .font(.body)
                        .lineLimit(5)
                }
            }
            .navigationBarTitle("Galnet News")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NewsBoard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsBoard()
                .colorScheme(.light)
            NewsBoard()
                .colorScheme(.dark)
        }
        
    }
}
