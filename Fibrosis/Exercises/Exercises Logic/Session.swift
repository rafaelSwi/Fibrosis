import Foundation

class Session: Identifiable, ObservableObject {
    
    var id: UUID = UUID()
    
    static var userSessions: [Session] = []
    
    var name: String = ""
    
    struct Exercise: Hashable {
        var tool: ExerciseTool
        var series: Int
        var repetitions: Int
    }
    
    @Published var exercises: [Exercise] = []
    
    init () {}
    
    init ( name: String, exercises: [Exercise] ) {
        self.name = name
        self.exercises = exercises
    }
    
}
