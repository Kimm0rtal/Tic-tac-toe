//
//  Alerts.swift
//  Tic-Tac-Toe
//
//  Created by Kimmortal on 26.12.2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title : Text
    let message: Text
    var ButtonTitle: Text
    
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("Flawless Victory"),
                                    message:  Text("You're #1"),
                                    ButtonTitle:  Text("Rematch"))
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                       message:  Text("You suck"),
                                       ButtonTitle:  Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw"),
                                message:  Text("Close One!"),
                                ButtonTitle:  Text("Go Again!"))
    
}
