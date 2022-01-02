//
//  ContentView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 15.12.21.
//

import SwiftUI
import CoreData

struct MainView: View {

    var body: some View {
        TabView {
            TrainerView(trainer: Trainer.demo)
                .tabItem {
                    Image("tab-trainer", bundle: .main)
                    Text("Trainer")
                }
            PokemonListView()
                .tabItem {
                    Image("tab-pokeball", bundle: .main)
                    Text("Pokedex")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
