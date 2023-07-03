import SwiftUI

struct SurveyView: View {
    @Environment(\.dismiss) var dismiss

    @State private var appRating: Int = 0
    @State private var officeRating: Int = 0
    @State private var likeApple: Bool = false
    
    var body: some View {
        VStack {
            Text("Survey")
                .font(.title)
                .padding()
            
            Text("How would you rate the app?")
                .font(.headline)
                .padding()
            
            HStack {
                ForEach(1...5, id: \.self) { rating in
                    Button(action: {
                        appRating = rating
                    }) {
                        Image(systemName: rating <= appRating ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .font(.title)
                    }
                }
            }
            .padding()
            
            Text("What do you think of the Apple office?")
                .font(.headline)
                .padding()
            
            HStack {
                ForEach(1...5, id: \.self) { rating in
                    Button(action: {
                        officeRating = rating
                    }) {
                        Image(systemName: rating <= officeRating ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .font(.title)
                    }
                }
            }
            .padding()
            
            Toggle(isOn: $likeApple) {
                Text("Do you like Apple?")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                globalresultcounter = globalresultcounter + 100000
                submitSurvey()
                dismiss()
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func submitSurvey() {
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
