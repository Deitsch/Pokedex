//
//  TrainerView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 25.12.21.
//

import SwiftUI

struct TrainerView: View {
    
    @State var trainer: Trainer

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name \(trainer.name)")
                    .font8bit(size: 20)
                HStack {
                    Image("gym01")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym1.grayscale)
                    Image("gym02")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym2.grayscale)
                    Image("gym03")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym3.grayscale)
                    Image("gym04")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym4.grayscale)
                }
                HStack {
                    Image("gym05")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym5.grayscale)
                    Image("gym06")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym6.grayscale)
                    Image("gym07")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym7.grayscale)
                    Image("gym08")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .grayscale(trainer.badges.gym8.grayscale)
                }
            }
            Image("trainer")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        let badges = BadgeInfo(gym1: true, gym2: true, gym3: true)

        let trainer = Trainer(ID: "2202", name: "Simon", money: "99999", badges: badges)

        return TrainerView(trainer: trainer)
    }
}

