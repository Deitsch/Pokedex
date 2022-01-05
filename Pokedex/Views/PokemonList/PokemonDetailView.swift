//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 21.12.21.
//

import SwiftUI
import PokeAPI

struct PokemonDetailView: View {
    @ObservedObject var pokemon: Pokemon
    @EnvironmentObject private var api: PokedAPIWrapper

    var body: some View {
        VStack {
            Text(pokemon.name ?? "")
            Text("Weight: \(pokemon.weight)")
            Text("Height: \(pokemon.height)")
            // TODO: load type to enum and get type badges accordingly
            ForEach(pokemon.typeArray) {
                Text($0.type ?? "")
            }
            ForEach(pokemon.abilityArray) {
                Text($0.name ?? "")
            }
            Text(pokemon.spirtes?.frontDefault ?? "no sprite")
            ForEach(pokemon.statArray) {
                Text("\($0.name)")
            }
        }.onAppear {
            api.loadPokemon(id: Int(pokemon.id))
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: PokemonListRowModelPreview.demo)
//            .environmentObject(PokedAPIWrapper(api: PokeAPIco(), context: PersistenceController.shared.container.newBackgroundContext()))
//    }
//}
