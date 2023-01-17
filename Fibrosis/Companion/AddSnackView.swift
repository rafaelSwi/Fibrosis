import SwiftUI

struct AddSnackView: View {
    
    @State private var snack = Snack (
        time: Date.now,
        enzymeAmount: 0,
        snackDescription: ""
    )
    
    var body: some View {
        
        ZStack {
            
            DefaultBackground()
            
            VStack {
                
                DefaultTitle(text: "Add Snack")
                
                DefaultSubTitle(text: "Enzyme Amount")
                
                EnzymeManager(snack: $snack)
                
                
                
            }
            
            
            
            
        }
        
    }
}

fileprivate struct EnzymeManager: View {
    
    @Binding var snack: Snack
    
    func formatNumber (_ num: Int) -> String {
        let newNum = String(num / 1000)
        var newNumString = "\(num)"
        if num > 1000 && num < 1000000 {
            newNumString = "\(newNum)K"
        } else if num > 1000000 {
            newNumString = "\(newNum)K"
        }
        
        return newNumString
        
    }
    
    var body: some View {
        
        HStack {
            
            if (snack.enzymeAmount <= 0) {
                
                Text ("﹣")
                    .foregroundColor(.gray)
                    .font(.system(size: 105))
                    .bold()
                
            }
            
            if (snack.enzymeAmount > 0) {
                
                Button (action: {snack.enzymeAmount -= 10_000}) {
                    
                    Text ("﹣")
                        .foregroundColor(.white)
                        .font(.system(size: 105))
                        .bold()
                    
                }
                
            }
            
            Text ("\(formatNumber(snack.enzymeAmount))")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .bold()
                .frame(width: 160, height: 42)
                .backgroundStyle(.gray.opacity(0.3))
                .cornerRadius(30)
            
            Button (action: {snack.enzymeAmount += 10_000}) {
                
                Text ("﹢")
                    .foregroundColor(.white)
                    .font(.system(size: 105))
                    .bold()
                
            }
        }
    }
}

