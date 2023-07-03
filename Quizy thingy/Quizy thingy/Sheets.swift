//
//  Sheets.swift
//  Quizy thingy
//
//  Created by Jhala family on 2/7/23.
//

import SwiftUI

struct winView: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    var body: some View {
        VStack{
            Text("Welp you beat the AI!")
            Button("Press to go to homescreen") {
                gotomainpage = true
            }
            .font(.title)
            .padding()
        }
        .fullScreenCover(isPresented: $gotomainpage){
            ContentView()
        }
        .interactiveDismissDisabled()
    }
}
struct loseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    var body: some View {
        VStack{
            Text("You Lost! AI is taking over the world. Ha Ha Ha Ha!")
            Button("Press to go to homescreen") {
                gotomainpage = true
            }
            .font(.title)
            .padding()
        }
        .fullScreenCover(isPresented: $gotomainpage){
            ContentView()
        }
        .interactiveDismissDisabled()
    }
}
struct drawView: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    var body: some View {
        VStack{
            Text("Its a draw. You are a failure. Cannot Win!")
            Button("Press to go to homescreen") {
                gotomainpage = true
            }
            .font(.title)
            .padding()
        }
        .fullScreenCover(isPresented: $gotomainpage){
            ContentView()
        }
        .interactiveDismissDisabled()
    }
}
struct ScoreSheetView: View {
    
    @State private var Homesheet = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Your overall score was:")
                .font(.title)
                .padding()
            
            Text("\(globalresultcounter)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("But it could not be saved due to you revealing too much about the Apple office and using the wrong SAP guidelines!! Hope we helped you be more productive.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Restart") {
                Homesheet = true
                globalresultcounter = 1000
            }
            .font(.title)
            .padding()
            
            Spacer()
        }
        .fullScreenCover(isPresented: $Homesheet){
            HomeView()
        }
        .interactiveDismissDisabled()
    }
}
