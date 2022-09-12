//
//  RoundViews.swift
//  Bullseye
//
//  Created by Hritvik Patel on 28/04/22.
//

import SwiftUI

struct RoundedViewStroked: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedViewFilled: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: 2.0)
            )
    }
}

struct PreviewView: View {
    
    var body: some View {
        VStack {
            RoundedViewStroked(systemName: "arrow.counterclockwise")
            RoundedViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
