import SwiftUI

struct NewsBoard: View {
    @StateObject var viewModel = NewsBoardViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.newsItems) { newsItem in
                NavigationLink(destination: NewsItemDetail(newsItem: newsItem)) {
                    LazyVStack(alignment: .leading, spacing: 5) {
                        Label(newsItem.date, systemImage: "calendar")
                            .font(.callout)
                        Text(newsItem.title)
                            .font(.headline)
                            .lineLimit(0)
                            .truncationMode(.tail)
                        Text(newsItem.body)
                            .font(.body)
                            .lineLimit(5)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Galnet News")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading: Button(action: {
                //launch modal/alert
            }, label: {
                Image(systemName: "info.circle")
            }))
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
