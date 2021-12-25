//
//  PokemonListItem.swift
//  Pokedex
//
//  Created by Simon Deutsch on 21.12.21.
//

import SwiftUI
import CoreData

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

struct PokemonListRow: View {
    @State var pokemon: PokemonListRowModel
    
    var body: some View {
        HStack {
            Text("#\(pokemon.rowId)")
                .font8bit(size: 16)
            Text(pokemon.rowName)
                .font8bit(size: 16)
            AsyncImage(url: URL(string: pokemon.rowSpriteURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Spacer()
        }
    }
}


struct PokemonListRow_Previews: PreviewProvider {
    struct PokemonListRowModelPreview: PokemonListRowModel {
        var rowId: Int
        var rowName: String
        var rowSpriteURL: String
    }
    
    static var previews: some View {
        let pokemon = PokemonListRowModelPreview(rowId: 1, rowName: "bulbasaur", rowSpriteURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/1.png")
        return PokemonListRow(pokemon: pokemon)
    }
}
