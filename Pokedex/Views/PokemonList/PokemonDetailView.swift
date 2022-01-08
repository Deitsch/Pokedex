//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 21.12.21.
//

import SwiftUI
import PokeAPI

struct PokemonDetailView: View {
    @ObservedObject var pokemon: Pokedex.Pokemon
    @EnvironmentObject private var api: PokeAPIController

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if let sprites = pokemon.spirtes, let pokemonUrl = URL(string: sprites.frontDefault) {
                        AsyncImage(url: pokemonUrl)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    ForEach(pokemon.typeArray) {
                        $0.image
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Weight")
                        Spacer()
                        Text("\(pokemon.weight)")
                    }
                    HStack {
                        Text("Height")
                        Spacer()
                        Text("\(pokemon.height)")
                    }
                }
                
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Stats").font8bit(size: 20, bold: true)
                    ForEach(pokemon.statArray) { stat in
                        HStack {
                            Text("\(stat.name)")
                            Spacer()
                            Text("\(stat.value)")
                        }
                    }
                }
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Abilities").font8bit(size: 20, bold: true)
                    ForEach(pokemon.abilityArray) {
                        Text($0.name ?? "")
                    }
                }
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .font8bit(size: 14)
            .onAppear {
                api.loadPokemon(id: Int(pokemon.id))
            }
            .navigationTitle(pokemon.name ?? "")
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: PokemonListRowModelPreview.demo)
//            .environmentObject(PokedAPIWrapper(api: PokeAPIco(), context: PersistenceController.shared.container.newBackgroundContext()))
//    }
//}
