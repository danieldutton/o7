import SwiftUI

struct NewsTitle: View {
    let newsItem: NewsItem
    
    var body: some View {
        Text(newsItem.title)
            .font(.headline)
            .foregroundColor(.gray)
            .lineLimit(0)
            .truncationMode(.tail)
    }
}

struct NewsTitle_Previews: PreviewProvider {
    static var previews: some View {
        NewsTitle(newsItem: preview_newsItem)
    }
}
