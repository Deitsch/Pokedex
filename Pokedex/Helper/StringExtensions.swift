//
//  StringExtensions.swift
//  Pokedex
//
//  Created by Simon Deutsch on 06.01.22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}

extension String {
    func charAt(_ characterIndex: Int) -> String {
        if characterIndex >= self.count {
            return ""
        }
        return String(self[index(startIndex, offsetBy: characterIndex)])
    }
}
