import SwiftUI

struct DefaultBackground: View {
    var body: some View {
        
        Rectangle()
            .ignoresSafeArea(.all)
            .gradient(colors: [CustomColor.tone01, CustomColor.tone02])
        
    }
}
