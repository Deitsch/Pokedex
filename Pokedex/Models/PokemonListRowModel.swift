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

extension Pokemon: PokemonListRowModel {
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

struct PokemonListRowModelPreview: PokemonListRowModel {
    var rowId: Int
    var rowName: String
    var rowSpriteURL: String
    
    static let demo = PokemonListRowModelPreview(rowId: 1, rowName: "bulbasaur", rowSpriteURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/1.png")
}
