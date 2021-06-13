import SwiftUI

struct NewsDate: View {
    let newsItem: NewsItem
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "calendar")
                .foregroundColor(.orange)
            Text(newsItem.date)
                .font(.callout)
                .foregroundColor(.gray)
                
        }
    }
}

struct NewsDate_Previews: PreviewProvider {
    static var previews: some View {
        NewsDate(newsItem: preview_newsItem)
    }
}

