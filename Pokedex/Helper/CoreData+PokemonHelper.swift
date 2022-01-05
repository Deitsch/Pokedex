//
//  PokemonCoreDataHelper.swift
//  Pokedex
//
//  Created by Simon Deutsch on 05.01.22.
//

import Foundation
import CoreData
import PokeAPI

// predicate cheat sheet
// https://academy.realm.io/posts/nspredicate-cheatsheet/

extension Pokemon {
    public var typeArray: [PokemonType] {
        let set = types as? Set<PokemonType> ?? []
        return Array(set)
    }
    
    
    public var abilityArray: [PokemonAbility] {
        let set = abilities as? Set<PokemonAbility> ?? []
        return Array(set)
    }
}

extension Pokemon {
    func populate(pokemonSummary: APIPokemonSummary) {
        id = Int32(pokemonSummary.id)
        name = pokemonSummary.name
        url = pokemonSummary.url
        spriteURL = pokemonSummary.spriteUrl
    }
    
    func populate(pokemon: APIPokemon, context: NSManagedObjectContext) {
        weight = Int32(pokemon.weight)
        height = Int32(pokemon.height)
        populateTypes(types: pokemon.types, context: context)
        populateAbilites(abilities: pokemon.abilities, context: context)
//        populateStats(stats: pokemon.stats)
        populateSprites(sprites: pokemon.sprites)
    }
    
    private func populateTypes(types: [APIPokemon.PokemonType], context: NSManagedObjectContext) {
        // TODO: empty types first to re add them - this way always latest are used
        types.forEach { type in
            let fetchRequest = PokemonType.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "type = %@", type.type)

            if let results = try? context.fetch(fetchRequest), let existingType = results.first {
                addToTypes(existingType)
            }
            else {
                let newType = PokemonType(context: context)
                newType.type = type.type
                addToTypes(newType)
            }
        }
    }
    
    private func populateAbilites(abilities: [APIPokemon.PokemonAbility], context: NSManagedObjectContext) {
        // TODO: empty types first to re add them - this way always latest are used
        abilities.forEach { ability in
            let fetchRequest = PokemonAbility.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name = %@", ability.name)

            if let results = try? context.fetch(fetchRequest), let existingAbility = results.first {
                addToAbilities(existingAbility)
            }
            else {
                let newType = PokemonAbility(context: context)
                newType.name = ability.name
                addToAbilities(newType)
            }
        }
    }
    
    private func populateStats(stats: [APIPokemon.PokemonStat]) {
        self.stats = stats.map { Stat(apiPokemonStats: $0) }
    }
    
    private func populateSprites(sprites: APIPokemon.PokemonSprites) {
        self.spirtes = Sprites(apiPokemonSprites: sprites)
    }
}
