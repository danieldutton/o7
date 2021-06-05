import SwiftUI

struct NewsItemDetail: View {
    let newsItem: NewsItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(newsItem.date)
                Text(newsItem.title)
                Text(newsItem.body)
            }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let newsItem = NewsItem(date: "Jan 24 2024", title: "Title", body: "Body")
        return NewsItemDetail(newsItem: newsItem)
    }
}
