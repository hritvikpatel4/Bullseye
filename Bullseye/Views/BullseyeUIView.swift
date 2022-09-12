//
//  BullseyeUIView.swift
//  Bullseye
//
//  Created by Hritvik Patel on 27/04/22.
//

import SwiftUI

struct BullseyeUIView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the slider as close as you can to")
                .padding(.horizontal)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue,
                   in: 1.0...100.0
            )
            SliderLabelText(text: "100")
        }
    }
}

struct HitMeButtonView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit me!".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
    }
}

struct BullseyeUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        BullseyeUIView()
        BullseyeUIView()
            .preferredColorScheme(.dark)
    }
}
