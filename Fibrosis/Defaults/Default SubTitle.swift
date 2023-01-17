import SwiftUI

struct DefaultSubTitle: View {
    
    @State var text: String
    
    var body: some View {
        
        ZStack {
            
            Text (text)
                .font(.largeTitle)
                .foregroundColor(.black.opacity(0.3))
                .blur(radius: 10)
            
            Text (text)
                .font(.largeTitle)
                .foregroundColor(.black)
            
        }
    }
}
