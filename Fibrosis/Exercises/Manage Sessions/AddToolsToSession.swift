import SwiftUI

struct AddToolsToSession: View {
    
    @ObservedObject var session: Session
    
    @State var exercise = Session.Exercise(
        tool: ExerciseTool.shaker,
        series: 0,
        repetitions: 0
    )
    
    @State var hasSelected: Bool = false
    
    var body: some View {
        
        VStack {
            
            DefaultTitle(text: "Select a Tool")
            
            ScrollView {
                
                ForEach (ExerciseTool.all_tools, id: \.self) { tool in
                        
                        Button (action: {
                            hasSelected.toggle()
                            exercise.tool = tool
                        }) {
                            
                            HStack {
                                
                                Image ("\(tool.image_name)")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .cornerRadius(15)
                                
                                Spacer()
                                
                                Text ("\(tool.name)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.all)
                            .background(Color.blue.opacity(0.4))
                            .cornerRadius(30)
                            .fullScreenCover(isPresented: $hasSelected) {
                                NextStep(session: session, exercise: $exercise)
                            }
                            
                        }
                } .padding(.all) // Loop's Final Brace
            }
        }
    }
}

fileprivate struct NextStep: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var session: Session
    
    @Binding var exercise: Session.Exercise
    
    func blocked () -> Bool {
        if exercise.repetitions == 0 {return true}
        if exercise.series == 0 {return true}
        return false
    }
    
    var body: some View {
        
        VStack {
            
            DefaultSubTitle(text: "How many series?")
            
            NumberManagerForTool(number: $exercise.series)
            
            DefaultSubTitle(text: "How many repetitions\nfor each serie?")
            
            NumberManagerForTool(number: $exercise.repetitions)
            
            Spacer()
            
            Image ("\(exercise.tool.image_name)")
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(15)
            
            Spacer()
            
            if !blocked() {
                
                Button (action: {
                    session.exercises.append(exercise)
                    presentationMode.wrappedValue.dismiss()
                    exercise.repetitions = 0
                    exercise.series = 0
                }) {
                    Text ("Add")
                        .foregroundColor(.white)
                        .frame(width: 350, height: 37)
                        .background(Color.green)
                        .cornerRadius(28)
                }
                .padding(.top)
                
            }
            
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

fileprivate struct NumberManagerForTool: View {
    
    @Binding var number: Int
    
    func higherThanZero (_ num: Int) -> Bool {
        if num > 0 {return true} else {return false}
    }
    
    var body: some View {
        
        HStack {
            
            Button (action: {number -= 1}) {
                
                Text ("﹣")
                    .foregroundColor(.white)
                    .font(.system(size: 92))
                    .bold()
                    .frame(width: 82, height: 82)
                    .background(Color.red.opacity(0.7))
                    .cornerRadius(80)
                    .padding(.leading)
                
            } .disabled(!higherThanZero(number))
            
            Text ("\(number)")
                .font(.system(size: 55))
                .foregroundColor(.black)
                .bold()
                .frame(width: 160, height: 42)
                .backgroundStyle(.gray.opacity(0.3))
                .cornerRadius(30)
            
            Button (action: {number += 1}) {
                
                Text ("﹢")
                    .foregroundColor(.white)
                    .font(.system(size: 92))
                    .bold()
                    .frame(width: 82, height: 82)
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(80)
                    .padding(.trailing)
                
            }
        }
    }
}

