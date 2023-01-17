import SwiftUI

struct DefaultTitle: View {
    
    @State var text: String
    
    var body: some View {
        
        ZStack {
            
            Text ("\(text)")
                .foregroundColor(.black.opacity(0.2))
                .font(.custom("Trebuchet MS", fixedSize: 34))
                .bold()
                .blur(radius: 5)
            
            Text ("\(text)")
                .foregroundColor(.black)
                .font(.custom("Trebuchet MS", fixedSize: 34))
                .bold()
                .blur(radius: 0)
            
        }
    }
}
