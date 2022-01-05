//
//  TrainerView.swift
//  Pokedex
//
//  Created by Simon Deutsch on 25.12.21.
//

import Combine
import SwiftUI

struct TrainerView: View {
    
    @State var trainer: Trainer
    @AppStorage(UserDefaultsKeys.gym1.rawValue) var gym1 = false
    @AppStorage(UserDefaultsKeys.gym2.rawValue) var gym2 = false
    @AppStorage(UserDefaultsKeys.gym3.rawValue) var gym3 = false
    @AppStorage(UserDefaultsKeys.gym4.rawValue) var gym4 = false
    @AppStorage(UserDefaultsKeys.gym5.rawValue) var gym5 = false
    @AppStorage(UserDefaultsKeys.gym6.rawValue) var gym6 = false
    @AppStorage(UserDefaultsKeys.gym7.rawValue) var gym7 = false
    @AppStorage(UserDefaultsKeys.gym8.rawValue) var gym8 = false
    
    let badgeSide: CGFloat = 70

    var body: some View {
        ScrollView {
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
                            .grayscale(gym1)
                            .onTapGesture {
                                gym1.toggle()
                            }
                        Image("gym02")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym2)
                            .onTapGesture {
                                gym2.toggle()
                            }
                        Image("gym03")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym3)
                            .onTapGesture {
                                gym3.toggle()
                            }
                        Image("gym04")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym4)
                            .onTapGesture {
                                gym4.toggle()
                            }
                    }
                    HStack {
                        Image("gym05")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym5)
                            .onTapGesture {
                                gym5.toggle()
                            }
                        Image("gym06")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym6)
                            .onTapGesture {
                                gym6.toggle()
                            }
                        Image("gym07")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym7)
                            .onTapGesture {
                                gym7.toggle()
                            }
                        Image("gym08")
                            .resizable()
                            .frame(width: badgeSide, height: badgeSide)
                            .grayscale(gym8)
                            .onTapGesture {
                                gym8.toggle()
                            }
                    }
                }
                Spacer()
            }
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView(trainer: Trainer.demo, gym1: true, gym2: true)
    }
}
