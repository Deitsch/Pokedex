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
        NavigationView {
            List(pokemon) { p in
                NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                    PokemonListRow(pokemon: p)
                }
            }
        }.onAppear(perform: {
            api.loadPokemon()
        })
    }
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

private extension PokemonInfo {
    var label: String {
        return (name ?? "") + " #\(id)"
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.api, PokeApi())
//    }
//}
