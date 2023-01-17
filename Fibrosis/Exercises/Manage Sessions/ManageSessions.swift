import SwiftUI

struct ManageSessions: View {
    
    @State var createNewSession: Bool = false
    
    @ObservedObject var user = defaultUser
    
    var body: some View {
            
            VStack {
                
                if !user.sessions.isEmpty {
                    
                    DefaultSubTitle(text: "Sessions")
                    
                    ForEach (user.sessions) { session in
                        
                        Text ("\(session.name)")
                            .foregroundColor(.white)
                            .fontWeight(.thin)
                            .frame(width: 190, height: 28)
                            .background(Color.gray)
                            .cornerRadius(3)
                        
                    }
                }
                
                Button (action: {
                    createNewSession.toggle()
                }, label: {
                    Text ("Create New Session")
                        .padding(.all)
                })
                .fullScreenCover(isPresented: $createNewSession) {
                    CreateNewSession(newSession: Session())
                }
            
        }
        
        
        
        
    }
}
