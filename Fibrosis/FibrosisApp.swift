import SwiftUI

@main
struct FibrosisApp: App {
    var body: some Scene {
        WindowGroup {
            PreparationScreen(session: Session(
                name: "Sessão Teste",
                exercises: [
                    Session.Exercise(tool: .respiron, series: 3, repetitions: 8),
                    Session.Exercise(tool: .ambu, series: 2, repetitions: 5),
                    Session.Exercise(tool: .cliniflo, series: 1, repetitions: 6)
                ]
            )
            )
        }
    }
}
