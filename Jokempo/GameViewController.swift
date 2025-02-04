//
//  GameViewController.swift
//  Jokempo
//
//  Created by Matheus Franceschini on 23/01/25.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var escolhaAdversarioLabel: UILabel!
    @IBOutlet weak var victoryLabel: UILabel!
    @IBOutlet weak var escolhaJogadorLabel: UILabel!
    @IBOutlet weak var scoreJogadorLabel: UILabel!
    @IBOutlet weak var scoreAdversarioLabel: UILabel!
    
    var scoreJogador: Int = 0
    var scoreAdversario: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    func configureButtons() {
        for button in buttonsCollection {
            button.layer.cornerRadius = 16
        }
    }
    
    func jogadaAdversario() -> String {
        let index = Int.random(in: 0...2)
        let jogadaAdversario: String = ["✊🏻", "✋🏻", "✌🏻"][index]
        
        escolhaAdversarioLabel.text = jogadaAdversario
        
        return jogadaAdversario
    }
    
    func configureLabel(player: String) {
        escolhaJogadorLabel.text = player
    }
    
    func verifyWinner(button: UIButton, jogadaAdversario: String) {
        guard let title = button.titleLabel?.text else { return }
        
        if title == "✊🏻" && jogadaAdversario == "✊🏻" {
            victoryLabel.text = "It's a tie! 😬"
            configureLabel(player: title)
        } else if title == "✊🏻" && jogadaAdversario == "✋🏻" {
            victoryLabel.text = "You lose! ❌"
            configureLabel(player: title)
            incrementScoreEnemy()
        } else if title == "✊🏻" && jogadaAdversario == "✌🏻" {
            victoryLabel.text = "You won! ⭐️"
            configureLabel(player: title)
            incrementScorePlayer()
        }
        
        if title == "✋🏻" && jogadaAdversario == "✊🏻" {
            victoryLabel.text = "You won! ⭐️"
            configureLabel(player: title)
            incrementScorePlayer()
        } else if title == "✋🏻" && jogadaAdversario == "✋🏻" {
            victoryLabel.text = "It's a tie! 😬"
            configureLabel(player: title)
        } else if title == "✋🏻" && jogadaAdversario == "✌🏻" {
            victoryLabel.text = "You lose! ❌"
            configureLabel(player: title)
            incrementScoreEnemy()
        }
        
        if title == "✌🏻" && jogadaAdversario == "✊🏻" {
            victoryLabel.text = "You lose! ❌"
            configureLabel(player: title)
            incrementScoreEnemy()
        } else if title == "✌🏻" && jogadaAdversario == "✋🏻" {
            victoryLabel.text = "You won! ⭐️"
            configureLabel(player: title)
            incrementScorePlayer()
        } else if title == "✌🏻" && jogadaAdversario == "✌🏻" {
            victoryLabel.text = "It's a tie! 😬"
            configureLabel(player: title)
        }
        
    }
    
    func incrementScorePlayer() {
        scoreJogador += 1
        scoreJogadorLabel.text = "Score: \(scoreJogador)"
    }
    
    func incrementScoreEnemy() {
        scoreAdversario += 1
        scoreAdversarioLabel.text = "Score: \(scoreAdversario)"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let jogadaAdversario = jogadaAdversario()
        verifyWinner(button: sender, jogadaAdversario: jogadaAdversario)
    }
    
}
