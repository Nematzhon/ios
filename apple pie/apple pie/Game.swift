//
//  Game.swift
//  apple pie
//
//  Created by Rizayev Nematzhon on 8/1/20.
//  Copyright © 2020 Rizayev Nematzhon. All rights reserved.
//

import Foundation

struct Game{
    var word:String
    var incorrectmovesRemaining:Int
    var guessedletters: [Character]
    var formattedword: String{
        var guessedword = ""
        for letter in word{
            if guessedletters.contains(letter){
                guessedword+="\(letter)"
            }
            else{
                guessedword+="_"
            }
        
        }
        return guessedword
        
    }

    mutating func playerGuessed(letter:Character){
        guessedletters.append(letter)
        if !word.contains(letter){
            incorrectmovesRemaining-=1
        }
}
}
