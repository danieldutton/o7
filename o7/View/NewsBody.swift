import SwiftUI

struct NewsBody: View {
    let newsItem: NewsItem
    
    var body: some View {
        Text(newsItem.content)
            .font(.body)
            .lineLimit(5)
    }
}

struct NewsBody_Previews: PreviewProvider {
    static var previews: some View {
        NewsBody(newsItem: preview_newsItem)
    }
}
