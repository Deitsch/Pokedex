//
//  LoginView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 23.12.21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var enteredCode = ""
    @State private var openPokedex = false
    @State private var showingAlert = false
    @Binding var isLoggedIn: Bool
    @Binding var hasAppeared: Bool
    @AppStorage(UserDefaultsKeys.code.rawValue) var code = ""
    @AppStorage(UserDefaultsKeys.inSetup.rawValue) var inSetup = true
    
    let screenHeight: CGFloat = 280
    let padding: CGFloat = 20
    let bottomExtraSpace: CGFloat = 20
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Spacer()
                        ZStack() {
                            Rectangle()
                                .fill(Color.pokemonLightGray)
                                .frame(height: screenHeight + 2*padding + bottomExtraSpace)
                                .cornerRadius(20)
                                .offset(y: bottomExtraSpace/2)
                            Rectangle()
                                .fill(Color.pokemonDarkGray)
                                .frame(height: screenHeight)
                                .cornerRadius(20)
                                .padding(padding)
                                .overlay(alignment: .center) {
                                    VStack {
                                        HStack {
                                            Text("Code").foregroundColor(.red)
                                            TextField("", text: $enteredCode)
                                                .keyboardType(.numberPad)
                                                .borderBottom()
                                                .foregroundColor(.red)
                                        }
                                    }
                                    .padding(2*padding)
                                    .font8bit(size: 16)
                                }
                                .overlay(alignment: .top) {
                                    HStack {
                                        Circle()
                                            .fill(.red)
                                            .frame(width: 10, height: 10)
                                            .offset(x: 45, y: 5)
                                        Circle()
                                            .fill(.red)
                                            .frame(width: 10, height: 10)
                                            .offset(x: 50, y: 5)
                                    }
                                }
                                .overlay(alignment: .bottomTrailing) {
                                    VStack(spacing: 2) {
                                        Rectangle()
                                            .frame(width: 30, height: 5)
                                            .cornerRadius(20)
                                        Rectangle()
                                            .frame(width: 30, height: 5)
                                            .cornerRadius(20)
                                        Rectangle()
                                            .frame(width: 30, height: 5)
                                            .cornerRadius(20)
                                    }
                                    .offset(x: -20, y: 10)
                                }
                                .overlay(alignment: .bottomLeading) {
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 16, height: 16)
                                        .cornerRadius(20)
                                    .offset(x: 40, y: 10)
                                }
                        }
                        HStack() {
                            Button(action: {
                                if enteredCode == code {
                                    withAnimation(.linear(duration: 0.5)) {
                                        isLoggedIn = true
                                    }
                                }
                                else {
                                    showingAlert = true
                                }
                            }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.pokemonDarkGray)
                                .background(Color.pokemonLightGray)
                                .clipShape(Circle())
                            }
                        }
                        .offset(y: 20)
                        Spacer()
                        HStack(spacing: 30) {
                            Rectangle()
                                .fill(.green)
                                .frame(width: 40, height: 6)
                                .cornerRadius(20)
                                .onTapGesture{ toggleOpenPokedex() }
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 40, height: 6)
                                .cornerRadius(20)
                                .onTapGesture{ toggleOpenPokedex() }
                        }
                    }
                    .padding(padding)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
//            .zIndex(8) // use this for development
            
            if !openPokedex {
                Rectangle()
                    .fill(Color.pokemonRed)
                    .zIndex(4)
                Image("pokedex-upper")
                    .transition(.move(edge: .top))
                    .offset(y: -6)
                    .onTapGesture{ toggleOpenPokedex() }
                    .zIndex(5)
                Image("pokedex-lower")
                    .transition(.move(edge: .bottom))
                    .offset(y: -6)
                    .onTapGesture{ toggleOpenPokedex() }
                    .zIndex(6)
                    .overlay {
                        Text("Tap to open Pokedex")
                            .font8bit(size: 20)
                            .foregroundColor(.white)
                            .zIndex(7)
                    }
            }
        }
        .fullScreenCover(isPresented: $inSetup) {
            SetupView(inSetup: $inSetup)
        }
        .alert("Code was wrong", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
        .background(Color.pokemonRed)
        .onAppear() {
            if !hasAppeared {
                hasAppeared = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    toggleOpenPokedex()
                }
            }
        }
    }
    
    func toggleOpenPokedex() {
        withAnimation(.linear(duration: 1)) {
            openPokedex.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false), hasAppeared: .constant(true))
    }
}
