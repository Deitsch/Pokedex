//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Simon Deutsch on 15.12.21.
//

import SwiftUI
import PokeAPI

// Create an environment key
private struct PokeAPIKey: EnvironmentKey {
    static let defaultValue: PokeAPI = PokeAPI()
}

// ## Introduce new value to EnvironmentValues
extension EnvironmentValues {
    var api: PokeAPI {
        get { self[PokeAPIKey.self] }
        set { self[PokeAPIKey.self] = newValue }
    }
}

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared
    let pokeAPI = PokeAPI()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.api, pokeAPI)
        }
    }
}
