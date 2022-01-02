//
//  TrainerView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 25.12.21.
//

import SwiftUI

struct TrainerView: View {
    
    @State var trainer: Trainer
    let badgeSide: CGFloat = 70

    var body: some View {
        VStack {
            Image("trainer")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            VStack {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("\(trainer.name)")
                }
                
                HStack {
                    Text("ID")
                    Spacer()
                    Text("\(trainer.ID)")
                }
            
                HStack {
                    Text("Money")
                    Spacer()
                    Text("\(trainer.money)¥")
                }
            }
            .font8bit(size: 20)
            .padding(30)
            VStack {
                HStack {
                    Image("gym01")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym1)
                    Image("gym02")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym2)
                    Image("gym03")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym3)
                    Image("gym04")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym4)
                }
                HStack {
                    Image("gym05")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym5)
                    Image("gym06")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym6)
                    Image("gym07")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym7)
                    Image("gym08")
                        .resizable()
                        .frame(width: badgeSide, height: badgeSide)
                        .grayscale(trainer.badges.gym8)
                }
            }
            Spacer()
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView(trainer: Trainer.demo)
    }
}

