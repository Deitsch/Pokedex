//
//  TrainerView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 25.12.21.
//

import SwiftUI

struct TrainerView: View {

    var body: some View {
        VStack {
            HStack {
                Image("gym01")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym02")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym03")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym04")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            HStack {
                Image("gym05")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym06")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym07")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image("gym08")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView()
    }
}

