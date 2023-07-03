//
//  GameView.swift
//  Tic-Tac-Toe
//
//  Created by Kevin Nelson on 5/19/21.
//
import SwiftUI


struct TicTacToeviewHard: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State private var moves: [Move2?] = Array(repeating: nil, count: 9)
    @State private var isGameBoardDisabled = false
    @State private var win = false
    @State private var lose = false
    @State private var draw = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(0..<9) { i in
                        ZStack{
                            Circle()
                            .foregroundColor(.blue).opacity(0.8)
                            .frame(width: geometry.size.width/3 - 15,
                                   height: geometry.size.width/3 - 15)
                            
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                        .onTapGesture {
                            if isSquareOccupied(in: moves, forIndex: i) { return }
                            moves[i] = Move2(player: .human, boardIndex: i)
                            
                            if checkWinCondition(for: .human, in:  moves){
                                win = true
                                globalresultcounter = globalresultcounter + 10000
                                return
                            }
                            
                            if checkForDraw(in: moves){
                                draw = true
                                globalresultcounter = globalresultcounter + 100
                                return
                            }
                            
                            isGameBoardDisabled = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move2(player: .computer, boardIndex: computerPosition)
                                isGameBoardDisabled = false
                                
                                if checkWinCondition(for: .computer, in:  moves){
                                    lose = true
                                    return
                                }
                                
                                if checkForDraw(in: moves){
                                    return
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
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
    
    func isSquareOccupied(in moves: [Move2?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index})
    }
    
    func determineComputerMovePosition(in moves: [Move2?]) -> Int{
        
        // If AI can win, then win
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        let computerMoves = moves.compactMap {$0}.filter { $0.player == .computer }
        let computerPositions = Set(computerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPositions)
            if winPositions.count == 1{
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        
        // If AI can't win, then block
        let humanMoves = moves.compactMap {$0}.filter { $0.player == .human }
        let humanPositions = Set(humanMoves.map {$0.boardIndex})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humanPositions)
            if winPositions.count == 1{
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        
        // If AI can't block, then take middle square
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) { return centerSquare }
        
        // If AI can't take middle square, then take a random square
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move2?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        let playerMoves = moves.compactMap {$0}.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        return false
    }
    
    func checkForDraw(in moves: [Move2?])-> Bool{
        return moves.compactMap {$0}.count == 9
    }
    
    func resetGame(){
        moves = Array(repeating: nil, count: 9)
    }
}

enum Player{
    case human, computer
}

struct Move2 {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
    
}

struct TicTacToeviewHard_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeviewHard()
    }
}
