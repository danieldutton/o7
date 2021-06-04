import SwiftUI

struct NewsBoard: View {
    var body: some View {
        NavigationView {
            Text("Hello World")
                .navigationBarTitle("Galnet News")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NewsBoard_Previews: PreviewProvider {
    static var previews: some View {
        NewsBoard()
    }
}
