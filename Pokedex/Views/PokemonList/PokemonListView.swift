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
    @EnvironmentObject private var controller: PokeAPIController
    
    @State private var showingAlert = false
    @State private var searchText = ""
    
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
      animation: .default
    )
    private var pokemon: FetchedResults<Pokemon>
    
    var pokemonNames: [String] {
        return pokemon.compactMap{ $0.name }
    }
    
    var body: some View {
        List(pokemon) { p in
            NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                PokemonListRow(pokemon: p)
            }.swipeActions(edge: .trailing) {
                Button(role: .cancel) {
                    showingAlert = !controller.toggleTeam(pokemon: p)
                } label: {
                    Label("Add", image: p.inTeam ? "pokeball" : "pokeball-gray")
                }
            }
        }
        .refreshable {
            controller.loadPokemon()
        }
//        .searchable(text: $searchText) {
//            ForEach(pokemonNames, id: \.self) { pokemonName in
//                    Text(pokemonName).searchCompletion(pokemonName)
//            }
//        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { sText in
            pokemon.nsPredicate = sText.isEmpty
                ? nil
                : NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Pokedex.Pokemon.name), sText)
        }
        .alert("Team is full, remove Pokemon first", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
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
