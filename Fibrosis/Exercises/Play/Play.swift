import SwiftUI

struct PreparationScreen: View {
    
    @ObservedObject var session: Session
    
    @State var play: Bool = false
    
    var body: some View {
        
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
            
            
        }
        
        
    }
}

struct Playing: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var session: Session
    
    func nextSeries () {
        if (repetitions > session.exercises[exercise].repetitions)
        {
            repetitions = 0
            series += 1
        }
    }
    
    func nextExercise () {
        if (series >= session.exercises[exercise].series)
        {
            exercise += 1
            series = 0
        }
    }
    
    @State var repetitions: Int = 0 {
        didSet {
            nextSeries()
        }
    }
    
    @State var series: Int = 0 {
        didSet {
            nextExercise()
        }
    }
    @State var exercise: Int = 0
    
    var body: some View {
        
        let currentExercise = session.exercises[exercise]
        
        Text ("Series \(series+1)/\(currentExercise.series)")
            .font(.custom("Optima", fixedSize: 60))
        
        Spacer()
        
        Button (action: {repetitions+=1} , label: {
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
        
        // Return Button
        Button (action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            DefaultReturnButton()
        }
        .padding(.bottom)
        
    }
}

