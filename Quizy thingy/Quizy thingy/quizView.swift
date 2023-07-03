import SwiftUI

struct QuestionView: View {
    @State private var selectedOption: String = ""
    @State private var showCorrectSheet = false
    @State private var showWrongSheet = false
    
    var body: some View {
        VStack {
            Text("Question:")
                .font(.headline)
                .padding()
            
            Text("Which of the following is a Fibonacci number?")
                .font(.title)
                .padding()
            
            Button(action: {
                selectedOption = "10946"
            }) {
                Text("10,946")
                    .foregroundColor(.white)
                    .padding()
                    .background(selectedOption == "10946" ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                selectedOption = "4181"
            }) {
                Text("4,181")
                    .foregroundColor(.white)
                    .padding()
                    .background(selectedOption == "4181" ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                selectedOption = "65432"
            }) {
                Text("65,432")
                    .foregroundColor(.white)
                    .padding()
                    .background(selectedOption == "65432" ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                selectedOption = "56789"
            }) {
                Text("56,789")
                    .foregroundColor(.white)
                    .padding()
                    .background(selectedOption == "56789" ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                checkAnswer()
            }) {
                Text("Check Answer")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showCorrectSheet) {
            CorrectSheet()
        }
        .sheet(isPresented: $showWrongSheet) {
            WrongSheet()
        }
    }
    
    func checkAnswer() {
        if selectedOption == "10946" {
            showCorrectSheet = true
            globalresultcounter = globalresultcounter + 100
        } else {
            showWrongSheet = true
        }
    }
}

struct CorrectSheet: View {
    var body: some View {
        VStack {
            Text("Correct Answer!")
                .font(.title)
                .padding()
            
            // Add additional content for the correct answer sheet
        }
    }
}

struct WrongSheet: View {
    var body: some View {
        VStack {
            Text("Wrong Answer!")
                .font(.title)
                .padding()
            
            // Add additional content for the wrong answer sheet
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
