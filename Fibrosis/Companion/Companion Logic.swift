import Foundation

struct Snack: Codable {
    
    var time: Date
    
    var enzymeAmount: Int
    
    var snackDescription: String
    
    var additionalMedications: [String] = []
    
}
