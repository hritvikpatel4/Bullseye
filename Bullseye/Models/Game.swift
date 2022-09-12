//
//  Game.swift
//  Bullseye
//
//  Created by Hritvik Patel on 27/04/22.
//

import Foundation

struct Game {
    
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData == true {
            leaderboardEntries.append(LeaderboardEntry(score: 89, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 414, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 750, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 12, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort {
            $0.score > $1.score
        }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

struct LeaderboardEntry {
    var score: Int
    var date: Date
}
