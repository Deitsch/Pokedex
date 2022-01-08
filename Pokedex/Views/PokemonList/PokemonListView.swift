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
    @EnvironmentObject private var controller: PokedAPIController
    
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
      animation: .default)
    private var pokemon: FetchedResults<Pokemon>
    
    var body: some View {
        List(pokemon) { p in
            NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                PokemonListRow(pokemon: p)
            }.swipeActions(edge: .trailing) {
                Button(role: .cancel) {
                    controller.toggleTeam(pokemon: p)
                } label: {
                    Label("Add", image: p.inTeam ? "pokeball" : "pokeball-gray")
                }
            }
        }
        .refreshable {
            controller.loadPokemon()
        }
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environmentObject(PokedexAPI(api: PokeAPI(), context: PersistenceController.shared.container.viewContext))
//    }
//}
