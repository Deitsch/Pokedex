//
//  PokemonTypes.swift
//  Pokedex
//
//  Created by Simon Deutsch on 06.01.22.
//

import Foundation
import SwiftUI

public enum PokemonTypes: String, CaseIterable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
}

extension PokemonTypes: Identifiable {
    public var id: RawValue { rawValue }
}

extension PokemonTypes {
    var image: Image {
        var image: Image
        switch self {
        case .bug:
            image = Image("Bug")
        case .dark:
            image = Image("Dark")
        case .dragon:
            image = Image("Dragon")
        case .electric:
            image = Image("Electric")
        case .fairy:
            image = Image("Fairy")
        case .fighting:
            image = Image("Fighting")
        case .fire:
            image = Image("Fire")
        case .flying:
            image = Image("Flying")
        case .ghost:
            image = Image("Ghost")
        case .grass:
            image = Image("Grass")
        case .ground:
            image = Image("Ground")
        case .ice:
            image = Image("Ice")
        case .normal:
            image = Image("Normal")
        case .poison:
            image = Image("Poison")
        case .psychic:
            image = Image("Pyschic")
        case .rock:
            image = Image("Rock")
        case .steel:
            image = Image("Steel")
        case .water:
            image = Image("Water")
        }
        return image
    }
}
