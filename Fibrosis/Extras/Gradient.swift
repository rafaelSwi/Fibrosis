import Foundation
import SwiftUI

extension View {
    public func gradient (colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
        
    }
}
