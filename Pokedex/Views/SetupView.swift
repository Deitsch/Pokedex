//
//  SetupView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 16.01.22.
//

import Foundation
import SwiftUI

struct SetupView: View {
    
    @AppStorage(UserDefaultsKeys.code.rawValue) var code = ""
    @Binding var inSetup: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image("pokeball2")
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .padding(.bottom, 20)
            ZStack {
                
                // First view: display of the code on screen
                HStack(spacing: 0) {
                    CodeInput(text: code.charAt(0))
                    Spacer(minLength: 10)
                    CodeInput(text: code.charAt(1))
                    Spacer(minLength: 10)
                    CodeInput(text: code.charAt(2))
                    Spacer(minLength: 10)
                    CodeInput(text: code.charAt(3))
                }
                .padding(.horizontal, 24)
                
                // Second view: actual textfield responsible for handling the data input
                // In foreground because it needs to be interacted with
                TextField("", text: $code)
                    .font8bit(size: 47)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: .infinity, maxHeight: 64)
                    .background(Color.clear)
                    .foregroundColor(Color.clear)
                    .accentColor(Color.clear)
                    .opacity(0.1)
                    .onChange(of: code, perform: { newCodeValue in
                        let only4 = newCodeValue.suffix(4)
                        if only4 != newCodeValue {  // Stops infinite loop
                            code = String(only4)
                        }
                        if only4.count == 4 {
                            dismissKeyboard()
                            inSetup = false
                        }
                    })
                    .onTapGesture {
                        code = "" // Reset the code to avoid confusion
                    }
            }
            .padding(.bottom, 20)
            Text("Set up a code to unluck your Pokedex in the future").font8bit(size: 16)
            Spacer()
        }
        .background(Color.pokemonRed)
        .foregroundColor(.white)
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var isCompleteCode: Bool {
        code.count == 4
    }
}


struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(inSetup: .constant(true))
    }
}
