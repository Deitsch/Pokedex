//
//  LoginView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 23.12.21.
//

import SwiftUI

enum LoginNavigation {
    case main
}

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var navigation: LoginNavigation?
    @State private var openPokedex = false
    
    let screenHeight: CGFloat = 320
    let padding: CGFloat = 20
    let bottomExtraSpace: CGFloat = 20

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationLink(destination: MainView(), tag: .main, selection: $navigation) {
                        EmptyView()
                    }
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
                                    TextField("", text: $username)
                                        .foregroundColor(.red)
                                        .placeholder("Username", color: .red, when: username.isEmpty)
                                    TextField("", text: $password)
                                        .foregroundColor(.red)
                                        .placeholder("Password", color: .red, when: password.isEmpty)
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
                            navigation = .main
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
//                .animation(.none, value: false)
                if !openPokedex {
                    Rectangle().fill(Color.pokemonRed)
                    Image("pokedex-upper")
                        .transition(.move(edge: .top))
                        .offset(y: -6)
                        .onTapGesture{ toggleOpenPokedex() }
                    Image("pokedex-lower")
                        .transition(.move(edge: .bottom))
                        .offset(y: -6)
                        .onTapGesture{ toggleOpenPokedex() }
                    Text("Tap to open Pokedex")
                        .font8bit(size: 20)
                        .foregroundColor(.white)
                }
            }
            .background(Color.pokemonRed)
            .navigationBarHidden(true)
        }
    }
    
    func toggleOpenPokedex() {
        withAnimation(.linear(duration: 1)) {
            openPokedex.toggle()
            print("toggle")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
