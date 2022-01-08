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
    let pokedexAPI = PokeAPIController(api: PokeAPIco(), container: PersistenceController.shared.container)
    
    @State var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if !isLoggedIn {
                    LoginView(isLoggedIn: $isLoggedIn)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }
                if isLoggedIn {
                    MainView(isLoggedIn: $isLoggedIn)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                }
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(pokedexAPI)
        }
    }
}

extension PokeAPIController: ObservableObject { }
