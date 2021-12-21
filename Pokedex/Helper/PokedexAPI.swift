//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Simon Deutsch on 19.12.21.
//

import Foundation
import PokeAPI
import Combine
import CoreData

class PokedexAPI {
    private let api: PokeAPI
    private let context: NSManagedObjectContext
    private var cancelables: [AnyCancellable] = []
    
    init(api: PokeAPI, context: NSManagedObjectContext) {
        self.api = api
        self.context = context
    }
    
    func loadPokemon() {
        api.loadPokemon().sink(receiveCompletion: {_ in }, receiveValue: { value in
            value.forEach { self.saveOrUpdatePokemon(pokemonSummary: $0) }
        }).store(in: &cancelables)
    }
    
    private func saveOrUpdatePokemon(pokemonSummary: PokemonSummary) {
        let fetchPokemonInfo: NSFetchRequest<PokemonInfo> = PokemonInfo.fetchRequest()
        fetchPokemonInfo.predicate = NSPredicate(format: "id = %i", pokemonSummary.id)

        let results = try? context.fetch(fetchPokemonInfo)
        
        let pInfo = results?.count == 0 ? PokemonInfo(context: context) : results?.first
        
        pInfo?.populate(pokemonSummary: pokemonSummary)
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

extension PokemonInfo {
    func populate(pokemonSummary: PokemonSummary) {
        self.id = Int32(pokemonSummary.id)
        self.name = pokemonSummary.name
        self.url = pokemonSummary.url
        self.spriteURL = pokemonSummary.spriteUrl
    }
}
