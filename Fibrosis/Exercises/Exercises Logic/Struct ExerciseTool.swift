import Foundation

struct ExerciseTool: Hashable {
    
    let name: String
    let image_name: String
    
    static let all_tools = [ambu, acapella, cliniflo, coach2, shaker, shakerClassic, therapep, respiron]
    
    static let ambu = ExerciseTool (
        name: "Ambu",
        image_name: "tool_ambu"
    )
    
    static let acapella = ExerciseTool (
        name: "Acapella",
        image_name: "tool_acapella"
    )
    
    static let cliniflo = ExerciseTool (
        name: "Cliniflo",
        image_name: "tool_cliniflo"
    )
    
    static let coach2 = ExerciseTool (
        name: "Coach II",
        image_name: "tool_coach2"
    )
    
    static let shaker = ExerciseTool (
        name: "Shaker",
        image_name: "tool_shaker"
    )
    
    static let shakerClassic = ExerciseTool (
        name: "Shaker Classic",
        image_name: "tool_shakerclassic"
    )
    
    static let therapep = ExerciseTool (
        name: "Therapep",
        image_name: "tool_therapep"
    )
    
    static let respiron = ExerciseTool (
        name: "Respiron",
        image_name: "tool_respiron"
    )
    
}
