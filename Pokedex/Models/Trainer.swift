//
//  Trainer.swift
//  Pokedex
//
//  Created by Simon Deutsch on 30.12.21.
//

import Foundation
import SwiftUI

class Trainer {
    let ID: String
    let name: String
    let money: String
    
    init(id: String, name: String, money: String) {
        self.ID = id
        self.name = name
        self.money = money
    }
    
    static let demo = Trainer(id: "2202", name: "Simon", money: "99999")
}
