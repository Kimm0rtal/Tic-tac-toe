//
//  StartView.swift
//  Tic-Tac-Toe
//
//  Created by Kimmortal on 1.1.2022.
//

import SwiftUI

struct StartView: View {
    
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.red,]) , startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                VStack {
                    
                    NavigationLink {
                        GameView()
                    } label: {
                        VStack {
                           Image("tictactoe")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .cornerRadius(25)
                            
                            Spacer()
                            
                            Text("Start Game")
                                .font(.system(size: 30))
                                .bold()
                                .foregroundColor(.red)
                                .frame(width: 300, height: 80)
                                .background(Color(.black))
                                .cornerRadius(25)
                            
                            Spacer ()
                        }
                    }
                }
            }
        }
        
        .accentColor(.red) 
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

