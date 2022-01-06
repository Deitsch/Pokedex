//
//  PokemonHelper.swift
//  Pokedex
//
//  Created by Simon Deutsch on 06.01.22.
//

import Foundation

extension Pokemon {
    public var typeArray: [PokemonTypes] {
        let set = types as? Set<PokemonType> ?? []
        return Array(set).compactMap{ $0.type }.compactMap{ PokemonTypes(rawValue: $0) }
    }
    
    
    public var abilityArray: [PokemonAbility] {
        let set = abilities as? Set<PokemonAbility> ?? []
        return Array(set)
    }
    
    public var statArray: [Stat] {
        return stats?.stats ?? []
    }
    
    public var spriteURLArray: [URL] {
        guard let sprites = spirtes else {
            return []
        }
        return [URL(string: sprites.frontDefault), URL(string: sprites.backDefault)].compactMap{ $0 }
    }
}
