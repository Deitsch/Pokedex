//
//  PokemonListRowModel.swift
//  Pokedex
//
//  Created by Simon Deutsch on 30.12.21.
//

import Foundation

// using this wrapper instead of directly PokemonInfo to have previews w/o CoreData 

protocol PokemonListRowModel {
    var rowId: Int { get }
    var rowName: String { get }
    var rowSpriteURL: String { get }
}

extension PokemonInfo: PokemonListRowModel {
    var rowId: Int {
        return Int(id)
    }
    
    var rowName: String {
        return name ?? ""
    }
    
    var rowSpriteURL: String {
        return spriteURL ?? ""
    }
    
}
