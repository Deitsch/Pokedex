//
//  ContentView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 15.12.21.
//

import SwiftUI
import CoreData 

struct MainView: View {
    
    @EnvironmentObject private var api: PokedexAPI
    @Binding var isLoggedIn: Bool

    var body: some View {
            TabView {
                NavigationView {
                    TrainerView(trainer: Trainer.demo).navigationBarTitle("Trainer")
                }
                .tabItem {
                    Label("Trainer", image: "tab-trainer")
                }
                
                NavigationView {
                    PokemonListView().navigationBarTitle("Pokemon")
                }
                .tabItem {
                    Label("Pokedex", image: "tab-pokeball")
                }
                
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
            }.onAppear(perform: {
                api.loadPokemon()
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
