//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 21.12.21.
//

import SwiftUI

struct PokemonDetailView: View {
    @State var pokemon: PokemonInfo
    
    var body: some View {
        Text(pokemon.name ?? "")
    }
}
