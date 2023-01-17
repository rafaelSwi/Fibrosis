import SwiftUI

struct DefaultLine: View {
    
    @State var color: Color
    @State var width: Int
    
    var body: some View {
        
        Rectangle()
            .frame(width: CGFloat(width), height: 1)
        
    }
}
