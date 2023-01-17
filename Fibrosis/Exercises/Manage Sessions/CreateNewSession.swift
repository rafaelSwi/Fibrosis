import SwiftUI

struct CreateNewSession: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var newSession: Session
    
    func ableToAppend () -> Bool {
        if newSession.name == "" {return false}
        if newSession.exercises.isEmpty {return false}
        return true
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                DefaultTitle(text: "Create Session")
                
                Spacer()
                
                Group {
                    
                    DefaultSubTitle(text: "Session Name")
                    
                    TextField ("", text: $newSession.name)
                        .frame(width: 180, height: 20)
                        .multilineTextAlignment(.center)
                    
                    DefaultLine(color: .white, width: 180)
                    
                } // "Session Name" Group
                
                Spacer()
                    .frame(height: 55)
                
                Group {
                    
                    if !newSession.exercises.isEmpty {
                        
                        DefaultSubTitle(text: "Tools")
                        
                        ForEach (newSession.exercises, id: \.self) { exercise in
                            
                            VStack (spacing: 3) {
                                
                                Text ("● \(exercise.tool.name) (\(exercise.series)/\(exercise.repetitions))")
                                    .font(.callout)
                                    .foregroundColor(.blue)
                                
                            }
                        }
                    }
                    
                    NavigationLink (
                        destination: AddToolsToSession(session: newSession),
                        label: {
                            Text ("Add Tools")
                                .foregroundColor(.white)
                                .frame(width: 260, height: 33)
                                .background(Color.blue)
                                .cornerRadius(28)
                                .padding(.top)
                        })
                    
                    if !newSession.exercises.isEmpty {
                        
                        Button (action: {
                            newSession.exercises.removeAll()
                        }) {
                            Text ("clear selection")
                                .foregroundColor(.red)
                                .font(.callout)
                                .fontWeight(.thin)
                        } .padding(.bottom)
                    }
                    
                } // "Tools" Group
                
                Spacer()
                
                Button (action: {
                    defaultUser.sessions.append(newSession)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text ("Create Session")
                        .font(.subheadline)
                }
                .disabled(!ableToAppend())
                
                // Return Button
                Button (action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    DefaultReturnButton()
                }
                .padding(.bottom)
                
            } .animation(.spring())
        }
    }
}
