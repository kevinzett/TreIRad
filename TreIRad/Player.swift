//
//  Player.swift
//  TreIRad
//
//  Created by Kevin Zetterlind on 2021-12-16.
//

import Foundation

class Player {
    var name : String
    var marker : String
    var playerScore : [Int]
    
    init(name: String, marker: String, playerScore: [Int]) {
        self.name = name
        self.marker = marker
        self.playerScore = playerScore
    }
}
