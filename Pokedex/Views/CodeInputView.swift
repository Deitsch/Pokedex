//
//  CodeInputView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 16.01.22.
//

import SwiftUI

struct CodeInput: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font8bit(size: 32)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: 64, height: 64)
            .cornerRadius(3)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(.white, lineWidth: 5)
            )
    }
}
