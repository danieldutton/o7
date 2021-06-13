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

struct NewsBody: View {
    let newsItem: NewsItem
    
    var body: some View {
        Text(newsItem.body)
            .font(.body)
            .lineLimit(5)
    }
}

struct NavBarImage: View {
    let systemIcon: String
    var body: some View {
        Image(systemName: systemIcon)
            .foregroundColor(.orange)
            .imageScale(.large)
            .frame(width: 44, height: 44, alignment: .trailing)
            .padding()
    }
}

struct NewsBoard: View {
    @StateObject var viewModel = NewsBoardViewModel()
    @State private var displayInfoAlert: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.newsItems) { newsItem in
                    NavigationLink(destination: NewsItemDetail(newsItem: newsItem)) {
                        LazyVStack(alignment: .leading, spacing: 5) {
                            NewsDate(newsItem: newsItem)
                            NewsTitle(newsItem: newsItem)
                            NewsBody(newsItem: newsItem)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Galnet News")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(leading: Button(action: {
                    displayInfoAlert.toggle()
                }, label: {
                    NavBarImage(systemIcon: "info.circle")
                }), trailing: Button(action: {
                    //refresh list
                }, label: {
                    NavBarImage(systemIcon: "arrow.clockwise")
                }))
                
                ProgressView()
                    .scaleEffect(1.4)
                    .opacity(viewModel.isPerformingWork ? 0: 1)
            }
        }
        .alert(isPresented: $displayInfoAlert, content: {
            copyrightAlert()
        })
    }
    
    private func copyrightAlert() -> Alert {
        Alert(
            title: Text("Acknowledgements"),
            message: Text("Elite Dangerous, c 1984 - 2019 Frontier Developments Plc.  All rights reserved."),
            dismissButton: .cancel(Text("OK")))
    }
}

struct NewsBoard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsBoard()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .colorScheme(.light)
            NewsBoard()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .colorScheme(.dark)
        }
    }
}
