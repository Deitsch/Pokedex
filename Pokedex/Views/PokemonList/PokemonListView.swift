//
//  PokemonList.swift
//  Pokedex
//
//  Created by Simon Deutsch on 16.12.21.
//

import Foundation
import SwiftUI

struct PokemonListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var api: PokedAPIWrapper
    
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
      animation: .default)
    private var pokemon: FetchedResults<Pokemon>
    
    var body: some View {
        List(pokemon) { p in
            NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                PokemonListRow(pokemon: p)
            }
        }
        .refreshable {
            api.loadPokemon()
        }
    }
}

private extension Pokemon {
    var label: String {
        return (name ?? "") + " #\(id)"
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environmentObject(PokedexAPI(api: PokeAPI(), context: PersistenceController.shared.container.viewContext))
//    }
//}
