//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Simon Deutsch on 05.01.22.
//

import Foundation

@objc public class Sprites: NSObject, NSSecureCoding {
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
    let backDefault: String
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    
    init(apiPokemonSprites: APIPokemon.PokemonSprites) {
        frontDefault = apiPokemonSprites.frontDefault
        frontFemale = apiPokemonSprites.frontFemale
        frontShiny = apiPokemonSprites.frontShiny
        frontShinyFemale = apiPokemonSprites.frontShinyFemale
        
        backDefault = apiPokemonSprites.backDefault
        backFemale = apiPokemonSprites.backFemale
        backShiny = apiPokemonSprites.backShiny
        backShinyFemale = apiPokemonSprites.backShinyFemale
    }
    
    // MARK: NSSecureCoding conformance for Transformable CoreData
    
    enum CodingKeys: String {
        case frontDefault
        case frontFemale
        case frontShiny
        case frontShinyFemale
        
        case backDefault
        case backFemale
        case backShiny
        case backShinyFemale
    }
    
    public static var supportsSecureCoding = true
    
    public required init?(coder: NSCoder) {
        frontDefault = coder.decodeObject(of: NSString.self, forKey: CodingKeys.frontDefault.rawValue) as String? ?? ""
        frontFemale = coder.decodeObject(of: NSString.self, forKey: CodingKeys.frontFemale.rawValue) as String? ?? ""
        frontShiny = coder.decodeObject(of: NSString.self, forKey: CodingKeys.frontShiny.rawValue) as String? ?? ""
        frontShinyFemale = coder.decodeObject(of: NSString.self, forKey: CodingKeys.frontShinyFemale.rawValue) as String? ?? ""
        
        backDefault = coder.decodeObject(of: NSString.self, forKey: CodingKeys.backDefault.rawValue) as String? ?? ""
        backFemale = coder.decodeObject(of: NSString.self, forKey: CodingKeys.backFemale.rawValue) as String? ?? ""
        backShiny = coder.decodeObject(of: NSString.self, forKey: CodingKeys.backShiny.rawValue) as String? ?? ""
        backShinyFemale = coder.decodeObject(of: NSString.self, forKey: CodingKeys.backShinyFemale.rawValue) as String? ?? ""
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(frontDefault, forKey: CodingKeys.frontDefault.rawValue)
        coder.encode(frontFemale, forKey: CodingKeys.frontFemale.rawValue)
        coder.encode(frontShiny, forKey: CodingKeys.frontShiny.rawValue)
        coder.encode(frontShinyFemale, forKey: CodingKeys.frontShinyFemale.rawValue)
        
        coder.encode(backDefault, forKey: CodingKeys.backDefault.rawValue)
        coder.encode(backFemale, forKey: CodingKeys.backFemale.rawValue)
        coder.encode(backShiny, forKey: CodingKeys.backShiny.rawValue)
        coder.encode(backShinyFemale, forKey: CodingKeys.backShinyFemale.rawValue)
    }
}
