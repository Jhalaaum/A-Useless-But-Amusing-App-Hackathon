//
//  GameView.swift
//  Quizy thingy
//
//  Created by Jhala family on 1/7/23.
//

import SwiftUI

var globalresultspace = 0

struct GameView: View {
    @State private var buttons: [ButtonModel] = []
    @State private var index = 0
    @State private var countdownTimer = 60
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var resultofspacegame = false
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("\(countdownTimer)")
                    .foregroundColor(.green)
                    .padding()
                    .onReceive(timer) { _ in
                        if countdownTimer > 0 && timerRunning {
                            countdownTimer -= 1
                        } else {
                            timerRunning = false
                            globalresultspace = index
                            resultofspacegame = true
                        }
                    }
                    .font(.system(size: 40, weight: .bold))
                
                Spacer()
                
                ZStack {
                    ForEach(buttons) { button in
                        if button.isVisible {
                            Button(action: {
                                removeButton(button)
                                index += 1
                            }) {
                                Image("villian")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            .position(button.position)
                            .transition(.move(edge: .top))
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1)) {
                                    updateButtonPosition(button)
                                }
                            }
                        }
                    }
                }
                VStack {
                    Image("airplane")
                        .resizable()
                        .frame(width: 45, height: 45)
                    Text("Kill the ships by pressing on them")
                        .foregroundColor(.cyan)
                }
                
                VStack {
                    Text("Your points: \(index)")
                        .foregroundColor(.red)
                }
            }
            .onAppear {
                createNewButton()
            }
        }
        .sheet(isPresented: $resultofspacegame) {
            resultview()
        }
    }
    
    func createNewButton() {
        if timerRunning {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                let button = ButtonModel(position: generateRandomPosition(), isVisible: true)
                buttons.append(button)
                
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    if let index = buttons.firstIndex(where: { $0.id == button.id }), buttons[index].isVisible {
                        removeButton(buttons[index])
                    }
                }
            }
        }
    }
    
    func generateRandomPosition() -> CGPoint {
        let x = CGFloat.random(in: 100...UIScreen.main.bounds.width + 500)
        let y = CGFloat.random(in: 0...UIScreen.main.bounds.height)
        return CGPoint(x: x, y: y)
    }
    
    func updateButtonPosition(_ button: ButtonModel) {
        if let index = buttons.firstIndex(where: { $0.id == button.id }) {
            buttons[index].position = generateRandomPosition()
        }
    }
    
    func removeButton(_ button: ButtonModel) {
        if let index = buttons.firstIndex(where: { $0.id == button.id }) {
            buttons.remove(at: index)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct ButtonModel: Identifiable {
    let id = UUID()
    var position: CGPoint
    var isVisible: Bool
}

struct resultview: View {
    @State private var gotomainpage = false
    var body: some View {
        VStack{
            Text("Your result is: \(globalresultspace)")
            Button("Press to go to homescreen") {
                globalresultcounter += globalresultspace*10000
                gotomainpage = true
            }
            .font(.title)
            .padding()
        }
        .fullScreenCover(isPresented: $gotomainpage){
            ContentView()
        }
    }
}
