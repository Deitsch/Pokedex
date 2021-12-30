//
//  BoolExtensions.swift
//  Pokedex
//
//  Created by Simon Deutsch on 30.12.21.
//

import SwiftUI

extension Bool {
    var grayscale: CGFloat {
        self ? 0 : 1
    }
}
