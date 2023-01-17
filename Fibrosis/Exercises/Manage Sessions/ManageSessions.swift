import SwiftUI

struct ManageSessions: View {
    
    @State var createNewSession: Bool = false
    
    @ObservedObject var user = defaultUser
    
    @State var play: Bool = false
    
    var body: some View {
            
            VStack {
                
                if !user.sessions.isEmpty {
                    
                    DefaultSubTitle(text: "Sessions")
                    
                    ForEach (user.sessions) { session in
                        
                        HStack {
                            
                            Button (action: {play.toggle()}, label: {
                                Circle()
                                    .foregroundColor(.green)
                                    .frame(width: 28, height: 28)
                            })
                            
                            Text ("\(session.name)")
                                .foregroundColor(.white)
                                .fontWeight(.thin)
                                .frame(width: 190, height: 28)
                                .background(Color.gray)
                                .cornerRadius(3)
                            
                        }
                        
                        .fullScreenCover(isPresented: $play) {
                            PreparationScreen(session: session)
                        }
                        
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
