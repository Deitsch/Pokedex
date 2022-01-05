//
//  Transformer.swift
//  Pokedex
//
//  Created by Simon Deutsch on 05.01.22.
//

import Foundation

@objc class PokedexTransformer: NSSecureUnarchiveFromDataTransformer {
    static let name = NSValueTransformerName(rawValue: String(describing: PokedexTransformer.self))
 
    override static var allowedTopLevelClasses: [AnyClass] {
        return [Stat.self, Sprites.self]
    }
    
    public static func register() {
        let transformer = PokedexTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
