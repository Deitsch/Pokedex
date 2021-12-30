//
//  Trainer.swift
//  Pokedex
//
//  Created by Simon Deutsch on 30.12.21.
//

import Foundation

struct Trainer {
    let ID: String
    let name: String
    let money: String
    let badges: BadgeInfo
}

struct BadgeInfo {
    let gym1: Bool
    let gym2: Bool
    let gym3: Bool
    let gym4: Bool
    let gym5: Bool
    let gym6: Bool
    let gym7: Bool
    let gym8: Bool
    
    init(gym1: Bool = false, gym2: Bool = false, gym3: Bool = false, gym4: Bool = false, gym5: Bool = false, gym6: Bool = false, gym7: Bool = false, gym8: Bool = false) {
        self.gym1 = gym1
        self.gym2 = gym2
        self.gym3 = gym3
        self.gym4 = gym4
        self.gym5 = gym5
        self.gym6 = gym6
        self.gym7 = gym7
        self.gym8 = gym8
    }
}
