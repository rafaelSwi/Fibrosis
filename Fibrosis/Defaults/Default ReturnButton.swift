import SwiftUI

struct DefaultReturnButton: View {
    var body: some View {
        Image(systemName: "arrow.down")
            .foregroundColor(.white)
            .frame(width: 350, height: 40)
            .background(Color.gray)
            .cornerRadius(28)
    }
}
