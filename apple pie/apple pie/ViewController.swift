//
//  ViewController.swift
//  apple pie
//
//  Created by Rizayev Nematzhon on 8/1/20.
//  Copyright © 2020 Rizayev Nematzhon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listofwords = ["xcode", "swift", "storyboard", "bug", "program","super","apple","game","iphone","macbook","ipad",]
    let incorrectmovesallowed = 7
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLoses = 0{
        didSet{
            newRound()
        }
    }
    var currentGame: Game!
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordlabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    func enableletterbuttons(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
        
    }
    func newRound(){
        if !listofwords.isEmpty{
            let newword = listofwords.removeFirst()
            currentGame = Game(word: newword, incorrectmovesRemaining: incorrectmovesallowed,guessedletters: [])
            enableletterbuttons(true)
            updateUI()
            
        }
        else{
            enableletterbuttons(false)
        }
        
        
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedword{
            letters.append(String(letter))
        }
        let wordwithspacing = letters.joined(separator: " ")
        correctWordlabel.text = wordwithspacing
            
        
        scorelabel.text = "Wins: \(totalWins), Losses: \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectmovesRemaining)")
    }
    func updategamestate(){
        if currentGame.incorrectmovesRemaining == 0{
            totalLoses+=1
        }
        else if currentGame.word == currentGame.formattedword{
            totalWins+=1
        }
        else{
            updateUI()
        }
    }
    
    
    @IBAction func lettertapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        updategamestate()
    }
    


}

