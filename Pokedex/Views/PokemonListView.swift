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
        sortDescriptors: [NSSortDescriptor(keyPath: \PokemonInfo.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PokemonInfo>
    @State private var cancelables: [AnyCancellable] = []

    var body: some View {
        Text("Pokemon List View").onAppear(perform: {
            api.loadPokemon().sink(receiveCompletion: {_ in }, receiveValue: { value in
                print(value)
            }).store(in: &cancelables)
        })
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.api, PokeApi())
//    }
//}
