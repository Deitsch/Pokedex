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

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PokemonInfo.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PokemonInfo>

    var body: some View {
        Text("Pokemon List View")
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
