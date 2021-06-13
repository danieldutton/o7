import SwiftUI

struct NewsItemDetail: View {
    let newsItem: NewsItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NewsDate(newsItem: newsItem)
                NewsTitle(newsItem: newsItem)
                NewsBody(newsItem: newsItem)
            }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        return NewsItemDetail(newsItem: preview_newsItem)
    }
}
