//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Simon Deutsch on 15.12.21.
//

import SwiftUI
import PokeAPI

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared
    let pokedexAPI = PokedexAPI(api: PokeAPI(), context: PersistenceController.shared.container.newBackgroundContext())

    var body: some Scene {
        WindowGroup {
            MainView()
//            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(pokedexAPI)
        }
    }
}

extension PokedexAPI: ObservableObject { }
