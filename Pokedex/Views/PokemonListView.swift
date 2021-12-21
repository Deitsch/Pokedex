//
//  PokemonList.swift
//  Pokedex
//
//  Created by Simon Deutsch on 16.12.21.
//

import Foundation
import SwiftUI
import Combine
import PokeAPI

struct PokemonListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.api) private var api
    
    @FetchRequest(
      sortDescriptors: [
        NSSortDescriptor(keyPath: \PokemonInfo.id, ascending: true)
      ],
      animation: .default)
    private var pokemon: FetchedResults<PokemonInfo>
    
    var body: some View {
        List(pokemon) { p in
            Text(p.label)
        }.onAppear(perform: {
            api.loadPokemon()
        })
    }
}

private extension PokemonInfo {
    var label: String {
        return (name ?? "") + " (\(id))"
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.api, PokeApi())
//    }
//}
