//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Simon Deutsch on 19.12.21.
//

import Foundation
import Combine
import CoreData
import PokeAPI

typealias APIPokemon = PokeAPI.Pokemon
typealias APIPokemonSummary = PokeAPI.PokemonSummary

class PokedAPIController {
    private let api: PokeAPIco
    private let container: NSPersistentContainer
    private let backgroundContext: NSManagedObjectContext
    private var cancelables: [AnyCancellable] = []
    
    init(api: PokeAPIco, container: NSPersistentContainer) {
        self.api = api
        self.container = container
        backgroundContext = container.newBackgroundContext()
    }
    
    func loadPokemon() {
        api.loadPokemon()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { value in
            value.forEach { self.saveOrUpdatePokemon(pokemonSummary: $0) }
        }).store(in: &cancelables)
    }
    
    func loadPokemon(id: Int) {
        api.loadPokemon(by: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { value in
            self.saveOrUpdatePokemon(pokemon: value)
        }).store(in: &cancelables)
    }
    
    private func saveOrUpdatePokemon(pokemonSummary: APIPokemonSummary) {
        let fetchPokemon: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchPokemon.predicate = NSPredicate(format: "id = %i", pokemonSummary.id)

        let results = try? backgroundContext.fetch(fetchPokemon)
        let pokemon = results?.count == 0 ? Pokemon(context: backgroundContext) : results?.first
        
        pokemon?.populate(pokemonSummary: pokemonSummary)
        saveContext()
    }
    
    private func saveOrUpdatePokemon(pokemon: APIPokemon) {
        let fetchPokemon: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchPokemon.predicate = NSPredicate(format: "id = %i", pokemon.id)

        guard let results = try? backgroundContext.fetch(fetchPokemon),
              let p = results.first else {
              assertionFailure("there should already have been an Pokemon when loading details")
            return
        }
        
        p.populate(pokemon: pokemon, context: backgroundContext)
        saveContext()
    }
    
    func saveContext() {
      do {
          try backgroundContext.save()
          try container.viewContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    
    func toggleTeam(pokemon: Pokemon) {
        pokemon.inTeam.toggle()
        saveContext()
    }
}
