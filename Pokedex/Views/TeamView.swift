//
//  TeamView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 08.01.22.
//

import SwiftUI

struct TeamView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var controller: PokeAPIController
    
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
      predicate: NSPredicate(format: "%K  == YES", #keyPath(Pokedex.Pokemon.inTeam)),
      animation: .default)
    private var pokemon: FetchedResults<Pokemon>
    
    var body: some View {
        VStack {
            if pokemon.count == 0 {
                VStack {
                    Spacer()
                    Text("Team is Empty")
                        .font8bit(size: 24, bold: true)
                        .padding(.bottom, 20)
                    Text("Slide to add Pokemon from the Pokemon List to your Team")
                        .font8bit(size: 18)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            else {
                List(pokemon) { p in
                    NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                        PokemonListRow(pokemon: p)
                    }.swipeActions(edge: .trailing) {
                        Button(role: .cancel) {
                            _ = controller.toggleTeam(pokemon: p)
                        } label: {
                            Label("Add", image: p.inTeam ? "pokeball" : "pokeball-gray")
                        }
                    }
                }
            }
        }
        .navigationTitle("Team \(pokemon.count)/\(PokeAPIController.teamSize)")
    }
}
