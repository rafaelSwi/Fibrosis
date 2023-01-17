import SwiftUI

struct PreparationScreen: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var session: Session
    
    @State var play: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.blue.opacity(0.5)
                .ignoresSafeArea(.all)
            
            VStack {
                
                DefaultTitle(text: "Play Session")
                
                Spacer()
                
                DefaultSubTitle(text: "\(session.name)")
                
                Button (action: {play.toggle()}, label: {
                    PlayButton()
                })
                
                .fullScreenCover(isPresented: $play) {
                    Playing(session: session)
                }
                
                Spacer()
                
                // Return Button
                Button (action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    DefaultReturnButton()
                }
                .padding(.bottom)
                
            }
        }
    }
}

struct Playing: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var session: Session
    
    func nextSeries () {
        if (repetitions > session.exercises[exercise].repetitions) {
            repetitions = 0
            series += 1
        }
    }
    
    func nextExercise () {
        if (series >= session.exercises[exercise].series) {
            series = 0
            exercise += 1
        }
    }
    
    func hasFinished () -> Bool {
        var check: Int = 0
        if session.exercises[exercise] == session.exercises.last
        { check += 1 }
        if series == session.exercises[exercise].series
        { check += 1 }
        if repetitions <= session.exercises[exercise].repetitions
        { check += 1 }
        if check == 3 {return true} else {return false}
    }
    
    @State var finished: Bool = false
    
    @State var repetitions: Int = 0 {
        didSet {
            if !hasFinished() { nextSeries() }
            if hasFinished() {finished.toggle()}
        }
    }
    
    @State var series: Int = 0 {
        didSet {
            if !hasFinished() { nextExercise() }
        }
    }
    
    @State var exercise: Int = 0
    
    var body: some View {
        
        let currentExercise = session.exercises[exercise]
        
        Text ("Series \(series+1)/\(currentExercise.series)")
            .font(.custom("Optima", fixedSize: 60))
        
        Spacer()
        
        Button (action: { repetitions+=1 } , label: {
            VStack {
                Text ("\(repetitions+1)")
                    .font(.system(size: 120))
                    .foregroundColor(.white)
            }
            .frame(width: 220, height: 220)
            .background(Color.blue)
            .cornerRadius(150)
        })
        
        
        ProgressView (
            "Progress",
            value: Double(repetitions),
            total: Double(currentExercise.repetitions)
        )
        
        Image ("\(currentExercise.tool.image_name)")
            .resizable()
            .frame(width: 125, height: 125)
            .cornerRadius(15)
            .padding(.all)
        
        Spacer()
        
            .fullScreenCover(isPresented: $finished) {
                FinishScreen()
            }
        
        // Return Button
        Button (action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            DefaultReturnButton()
        }
        .padding(.bottom)
        
    }
}

