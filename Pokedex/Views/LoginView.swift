//
//  LoginView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 23.12.21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            ZStack() {
                Rectangle()
                    .fill(Color.pokemonDarkGray)
                    .frame(height: 350)
                    .border(Color.pokemonLightGray, width: 20)
                    .cornerRadius(20)
                    .overlay(alignment: .center) {
                        VStack {
                            TextField("", text: $username)
                                .foregroundColor(.red)
                                .placeholder("Username", color: .red, when: username.isEmpty)
                            TextField("", text: $password)
                                .foregroundColor(.red)
                                .placeholder("Password", color: .red, when: password.isEmpty)
                        }.padding(40)
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
                    .background(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.pokemonLightGray)
                            .cornerRadius(20)
                            .offset(y: 20)
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
            Text("David")
                .font(Font.custom("Connection", size: 32, relativeTo: .title))
            Spacer()
        }.padding(20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
