//
//  TicTacToeview.swift
//  Quizy thingy
//
//  Created by Jhala family on 2/7/23.
//

import SwiftUI


struct TicTacToeview: View {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isgameboarddisable = false
    @State private var win = false
    @State private var draw = false
    @State private var lose = false
    
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(0..<9) { i in
                        ZStack{
                            Image("circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        .onTapGesture {
                            if issquaredcheck(in: moves, forIndex: i) { return }
                            moves[i] = Move(player: .human, boardIndex: i)
                            isgameboarddisable = true
                            
                            if checkWinCondition(for: .human, in: moves) {
                                print("Human wins")
                                win = true
                                globalresultcounter = globalresultcounter + 100
                                return
                            }
                            if checkfordraw(in: moves) {
                                print("draw")
                                draw = true
                                return
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isgameboarddisable = false
                                if checkWinCondition(for: .computer, in: moves) {
                                    print("computer wins")
                                    lose = true
                                    return
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .disabled(isgameboarddisable)
            .padding()
        }
        .sheet(isPresented: $win) {
            winView()
        }
        .sheet(isPresented: $lose) {
            loseView()
        }
        .sheet(isPresented: $draw) {
            drawView()
        }
    }
    func issquaredcheck(in moves: [Move?], forIndex index: Int)->Bool {
        return moves.contains(where: { $0?.boardIndex == index})
    }
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        
        while issquaredcheck(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    func checkWinCondition(for player: players, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        let playerMoves = moves.compactMap {$0}.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        return false
    }
    func checkfordraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
}

enum players {
    case human, computer
}

struct Move {
    let player: players
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
struct TicTacToeview_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeview()
    }
}
