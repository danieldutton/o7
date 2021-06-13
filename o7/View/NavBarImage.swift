import SwiftUI

struct NavBarImage: View {
    let systemIcon: String
    var body: some View {
        Image(systemName: systemIcon)
            .foregroundColor(.orange)
            .imageScale(.large)
            .frame(width: 44, height: 44, alignment: .trailing)
    }
}

struct NavBarImage_Previews: PreviewProvider {
    static var previews: some View {
        NavBarImage(systemIcon: "calendar")
    }
}
