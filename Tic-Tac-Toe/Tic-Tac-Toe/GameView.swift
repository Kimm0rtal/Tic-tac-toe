//
//  GameView.swift
//  Tic-Tac-Toe
//
//  Created by Kimmortal on 26.12.2021.
//
import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.red,]) , startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                
                VStack {
                    
                    
                    Spacer()
                    
                    //Making Tic-Tac-Toe Grid
                    LazyVGrid(columns: viewModel.columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                
                                GameSquareView(proxy: geometry)
                                
                                PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                                
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
                            }
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("**Human Wins: \(viewModel.humanWins)**")
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .font(.system(size: 20))
                        Text("**AI Wins: \(viewModel.computerWins)**")
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .font(.system(size: 20))
                        Text("**Draws: \(viewModel.draws)**")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            
                    }
                }
                .disabled(viewModel.isGameboardDisabled)
                .padding()
                .alert(item: $viewModel.alertItem, content: { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.ButtonTitle, action: { viewModel.resetGame() }))
                })
            }
        }
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Rectangle()
            .foregroundColor(.black).opacity(0.75)
            .frame(width: proxy.size.width/3 - 15,
                   height: proxy.size.width/3 - 15)
            .cornerRadius(25)
    }
}

struct PlayerIndicator: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
