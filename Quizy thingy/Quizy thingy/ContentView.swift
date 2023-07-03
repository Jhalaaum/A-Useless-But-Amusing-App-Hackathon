//
//  ContentView.swift
//  Quizy thingy
//
//  Created by Jhala family on 1/7/23.
//

import SwiftUI

var globalresultcounter = 1000

struct ContentView: View {
    @State var firstgame = false
    @State var secondgame = false
    @State var thirdgame = false
    @State var fourgame = false
    @State var fifthgame = false
    @State var sixthgame = false
    @State var sevengame = false
    @State var eightgame = false
    @State var lastsheet = false
    @State var Homepage = false

    
    var body: some View {
        ZStack{
            ScrollView(.horizontal) {
                HStack(spacing: -10) {
                    Image("A")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                firstgame = true
                            }) {
                                Text("Start")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    
                    Image("B")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                secondgame = true
                            }) {
                                Text("Press for a joke!")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("C")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                thirdgame = true
                            }) {
                                Text("Press for the ultimate quiz")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    
                    Image("D")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                fourgame = true
                            }) {
                                Text("TicTacToe(Easy)")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("E")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                fifthgame = true
                            }) {
                                Text("Rock Paper Sciccors")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("F")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                sixthgame = true
                            }) {
                                Text("TicTacToe(Hard)")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("G")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                sevengame = true
                            }) {
                                Text("Space Invaders")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("H")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                eightgame = true
                            }) {
                                Text("Survey")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                    Image("ending")
                        .resizable()
                        .ignoresSafeArea()
                        .background(.black)
                        .scaledToFit()
                        .overlay(
                            Button(action: {
                                lastsheet = true
                                Homepage = true
                            }) {
                                Text("Jiachen's realm")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                            }
                        )
                }
            }
            VStack{
                Text("Do not show too much of the Apple office!!!")
                    .foregroundColor(.red)
                    .bold()
                    .italic()
                
                Text("The Journey To JIACHEN'S REALM")
                    .font(.system(size: 25))
                    .foregroundColor(.yellow)
                Spacer()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $firstgame){
            StartMeme()
        }
        .sheet(isPresented: $secondgame){
            jokeView()
        }
        .sheet(isPresented: $thirdgame){
            QuestionView()
        }
        .fullScreenCover(isPresented: $fourgame){
            TicTacToeview()
        }
        .fullScreenCover(isPresented: $fifthgame){
            RockPaperSciccors()
        }
        .fullScreenCover(isPresented: $sixthgame){
            TicTacToeviewHard()
        }
        .fullScreenCover(isPresented: $sevengame){
            GameView()
        }
        .sheet(isPresented: $eightgame){
            SurveyView()
        }
        .sheet(isPresented: $lastsheet){
            ScoreSheetView()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
