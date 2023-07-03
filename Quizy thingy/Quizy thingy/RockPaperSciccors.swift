//
//  RockPaperSciccors.swift
//  Quizy thingy
//
//  Created by Jhala family on 3/7/23.
//

import SwiftUI

var whatcomputerchose: String?
var whatyouchose = ""

struct RockPaperSciccors: View {
    @State private var humanInput = ""
    @State private var arrayForComputer = ["rock", "paper", "sciccors"]
    @State private var computerChoice: String?
    @State private var computerwin = false
    @State private var drawofcomputerandplayer = false
    @State private var playerwin = false

    
    var body: some View {
        VStack{
            Text("Select your choice(rock,paper,sciccors): ")
                .font(.headline)
                .foregroundColor(.red)
            HStack{
                Button("Rock"){
                    humanInput = "rock"
                    computerChoice = arrayForComputer.randomElement()
                    whatcomputerchose = computerChoice
                    whatyouchose = humanInput
                    if computerChoice == "paper" {
                        computerwin = true
                    }
                    if computerChoice == "rock" {
                        drawofcomputerandplayer = true
                    }
                    if computerChoice == "sciccors" {
                        globalresultcounter = globalresultcounter + 100
                        playerwin = true
                    }

                }
                .padding()
                Button("Paper"){
                    humanInput = "paper"
                    computerChoice = arrayForComputer.randomElement()
                    whatcomputerchose = computerChoice
                    whatyouchose = humanInput
                    if computerChoice == "rock" {
                        computerwin = true
                    }
                    if computerChoice == "paper" {
                        drawofcomputerandplayer = true
                    }
                    if computerChoice == "sciccors" {
                        globalresultcounter = globalresultcounter + 100
                        playerwin = true
                    }
                }
                .padding()
                Button("Sciccors"){
                    humanInput = "sciccors"
                    computerChoice = arrayForComputer.randomElement()
                    whatcomputerchose = computerChoice
                    whatyouchose = humanInput
                    if computerChoice == "rock" {
                        computerwin = true
                    }
                    if computerChoice == "sciccors" {
                        drawofcomputerandplayer = true
                    }
                    if computerChoice == "paper" {
                        globalresultcounter = globalresultcounter + 100
                        playerwin = true
                    }

                }
                .padding()
            }
        }
        .sheet(isPresented: $playerwin) {
            winViewTictactoe()
        }
        .sheet(isPresented: $computerwin) {
            loseViewTicTacToe()
        }
        .sheet(isPresented: $drawofcomputerandplayer) {
            drawViewTicTacToe()
        }

    }
}

struct RockPaperSciccors_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperSciccors()
    }
}


struct winViewTictactoe: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    
    var body: some View {
        VStack{
            Text("Welp you beat the AI! Computer Chose \(whatcomputerchose ?? "") and you chose \(whatyouchose)!!")
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

struct loseViewTicTacToe: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    
    var body: some View {
        VStack{
            Text("You Lost! AI is taking over the world. Ha Ha Ha Ha! Computer Chose \(whatcomputerchose ?? "") and you chose \(whatyouchose)!!!")
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

struct drawViewTicTacToe: View {
    @Environment(\.dismiss) var dismiss
    @State private var gotomainpage = false
    
    var body: some View {
        VStack{
            Text("Its a draw. You are a failure. Cannot Win! Computer Chose \(whatcomputerchose ?? "") and you chose \(whatyouchose)!")
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
