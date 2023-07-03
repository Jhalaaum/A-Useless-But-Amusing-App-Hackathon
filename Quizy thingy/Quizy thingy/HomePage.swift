import SwiftUI

struct HomeView: View {
    @State private var showContentSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Jiachen's Realm")
                .font(.title)
                .padding()
            
            Button(action: {
                showContentSheet = true
            }) {
                Text("Start your journey to Jiachen's Realm")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .fullScreenCover(isPresented: $showContentSheet) {
                ContentView()
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
