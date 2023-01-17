import SwiftUI

struct PlayButton: View {
    var body: some View {
        VStack {
            Image(systemName: "play.fill")
                .resizable()
                .frame(width: 110, height: 110)
                .foregroundColor(.white)
        }
        .frame(width: 220, height: 220)
        .background(Color.blue)
        .cornerRadius(150)
    }
}
