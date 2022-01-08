//
//  TeamView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 08.01.22.
//

import SwiftUI

struct TeamView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var controller: PokedAPIController
    
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
      predicate: NSPredicate(format: "%K  == YES", #keyPath(Pokedex.Pokemon.inTeam)),
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
    }
}
