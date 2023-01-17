import Foundation

final class User: ObservableObject, Identifiable {
    
    @Published var sessions: [Session] = []
    
}

let defaultUser = User()
