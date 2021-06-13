import SwiftUI

struct NewsBoard: View {
    @StateObject var viewModel = NewsBoardViewModel()
    @State private var displayInfoAlert: Bool = false
    
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
                displayInfoAlert.toggle()
            }, label: {
                Image(systemName: "info.circle")
            }), trailing: Button(action: {
                //refresh list
            }, label: {
                Image(systemName: "arrow.clockwise")
            } ))
        }
        .alert(isPresented: $displayInfoAlert, content: {
            Alert(
                title: Text("Acknowledgements"),
                message: Text("Elite Dangerous, c 1984 - 2019 Frontier Developments Plc.  All rights reserved."),
                dismissButton: .cancel(Text("OK")))
        })
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
