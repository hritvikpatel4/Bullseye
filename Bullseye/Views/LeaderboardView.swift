//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Hritvik Patel on 29/04/22.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 10) {
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    LabelView()
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

//let scoreColWidth = 50.0
//let dateColWidth = 170.0
//let maxRowWidth = 480.0

struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: 50.0)
            Spacer()
            DateText(date: date)
                .frame(width: 170.0)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: 2.0)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: 480.0)
    }
}

struct HeaderView: View {
    
    @Binding var leaderboardIsShowing: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding()
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundedViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 56.0)
            Spacer()
            LabelText(text: "Score")
                .frame(width: 50.0)
            Spacer()
            LabelText(text: "Date")
                .frame(width: 170.0)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: 480.0)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
    }
}
