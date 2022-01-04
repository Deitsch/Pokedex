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

class PokedAPIWrapper {
    private let api: PokeAPIco
    private let context: NSManagedObjectContext
    private var cancelables: [AnyCancellable] = []
    
    init(api: PokeAPIco, context: NSManagedObjectContext) {
        self.api = api
        self.context = context
    }
    
    func loadPokemon() {
        api.loadPokemon().sink(receiveCompletion: {_ in }, receiveValue: { value in
            value.forEach { self.saveOrUpdatePokemon(pokemonSummary: $0) }
        }).store(in: &cancelables)
    }
    
    func loadPokemon(id: Int) {
        api.loadPokemon(by: id).sink(receiveCompletion: {_ in }, receiveValue: { value in
            self.saveOrUpdatePokemon(pokemon: value)
        }).store(in: &cancelables)
    }
    
    private func saveOrUpdatePokemon(pokemonSummary: APIPokemonSummary) {
        let fetchPokemon: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchPokemon.predicate = NSPredicate(format: "id = %i", pokemonSummary.id)

        let results = try? context.fetch(fetchPokemon)
        let pokemon = results?.count == 0 ? Pokemon(context: context) : results?.first
        
        pokemon?.populate(pokemonSummary: pokemonSummary)
        saveContext()
    }
    
    private func saveOrUpdatePokemon(pokemon: APIPokemon) {
        let fetchPokemon: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchPokemon.predicate = NSPredicate(format: "id = %i", pokemon.id)

        guard let results = try? context.fetch(fetchPokemon),
              let p = results.first else {
              assertionFailure("there should have been an Pokemon when loading details")
            return
        }
        
        p.populate(pokemon: pokemon)
        print("w", p.weight)
        print("h", p.height)
        saveContext()
    }
    
    private  func saveContext() {
      do {
        try context.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}

extension Pokemon {
    func populate(pokemonSummary: APIPokemonSummary) {
        id = Int32(pokemonSummary.id)
        name = pokemonSummary.name
        url = pokemonSummary.url
        spriteURL = pokemonSummary.spriteUrl
    }
    
    func populate(pokemon: APIPokemon) {
        weight = Int32(pokemon.weight)
        height = Int32(pokemon.height)
    }
}
