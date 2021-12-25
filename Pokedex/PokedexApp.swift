//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Simon Deutsch on 15.12.21.
//

import SwiftUI
import PokeAPI

// Create an environment key
private struct PokedexAPIKey: EnvironmentKey {
    static let defaultValue: PokedexAPI = PokedexAPI(api: PokeAPI(), context: PersistenceController.shared.container.viewContext)
}

// ## Introduce new value to EnvironmentValues
extension EnvironmentValues {
    var api: PokedexAPI {
        get { self[PokedexAPIKey.self] }
        set { self[PokedexAPIKey.self] = newValue }
    }
}

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared
    let pokedexAPI = PokedexAPI(api: PokeAPI(), context: PersistenceController.shared.container.viewContext)

    var body: some Scene {
        WindowGroup {
//            TrainerView()
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.api, pokedexAPI)
        }
    }
}
