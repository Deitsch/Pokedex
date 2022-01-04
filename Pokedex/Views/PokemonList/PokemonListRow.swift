//
//  PokemonListItem.swift
//  Pokedex
//
//  Created by Simon Deutsch on 21.12.21.
//

import SwiftUI
import CoreData

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
    static var previews: some View {
        PokemonListRow(pokemon: PokemonListRowModelPreview.demo)
    }
}
