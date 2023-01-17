import SwiftUI

@main
struct FibrosisApp: App {
    var body: some Scene {
        WindowGroup {
            CreateNewSession(newSession: Session())
        }
    }
}
