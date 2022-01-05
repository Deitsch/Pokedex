//
//  PokemonStat.swift
//  Pokedex
//
//  Created by Simon Deutsch on 05.01.22.
//

import Foundation

@objc public class StatWrapper: NSObject, NSSecureCoding {
    
    let stats: [Stat]
    
    init(stats: [Stat]) {
        self.stats = stats
    }
    
    // MARK: NSSecureCoding conformance for Transformable CoreData
    
    enum CodingKeys: String {
        case stats
    }
    
    public static var supportsSecureCoding = true
    
    public required init?(coder: NSCoder) {
        stats = coder.decodeObject(of: NSArray.self, forKey: CodingKeys.stats.rawValue) as! [Stat]
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(stats, forKey: CodingKeys.stats.rawValue)
    }
}

@objc public class Stat: NSObject, NSSecureCoding {
    
    let name: String
    let value: Int
    
    init(apiPokemonStats: APIPokemon.PokemonStat) {
        name = apiPokemonStats.name
        value = apiPokemonStats.baseStat
    }
    
    // MARK: NSSecureCoding conformance for Transformable CoreData
    
    enum CodingKeys: String {
        case name
        case value
    }
    
    public static var supportsSecureCoding = true
    
    public required init?(coder: NSCoder) {
        name = coder.decodeObject(of: NSString.self, forKey: CodingKeys.name.rawValue) as String? ?? ""
        value = coder.decodeInteger(forKey: CodingKeys.value.rawValue)
    }
    
    public func encode(with coder: NSCoder) {
        
        coder.encode(name, forKey: CodingKeys.name.rawValue)
        coder.encode(value, forKey: CodingKeys.value.rawValue)
    }
}

// Conformance for SwiftUI List & co
extension Stat: Identifiable { }
