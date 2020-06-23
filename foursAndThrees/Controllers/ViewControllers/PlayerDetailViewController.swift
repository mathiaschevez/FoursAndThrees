//
//  PlayerDetailViewController.swift
//  foursAndThrees
//
//  Created by Mathias on 6/20/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController, UITextFieldDelegate {
    
    var player: Player?
        
    //IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstScoreTextField: UITextField!
    @IBOutlet weak var secondScoreTextField: UITextField!
    @IBOutlet weak var thirdScoreTextField: UITextField!
    @IBOutlet weak var fourthScoreTextField: UITextField!
    @IBOutlet weak var fifthScoreTextField: UITextField!
    @IBOutlet weak var sixthScoreTextField: UITextField!
    @IBOutlet weak var seventhScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.firstScoreTextField.delegate = self
        self.secondScoreTextField.delegate = self
        self.thirdScoreTextField.delegate = self
        self.fourthScoreTextField.delegate = self
        self.fifthScoreTextField.delegate = self
        self.sixthScoreTextField.delegate = self
        self.seventhScoreTextField.delegate = self
        if let player = player {
            updateViews(player: player)
        }
    }
    
    
    //IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let playerName = nameTextField.text, !playerName.isEmpty else {return}
        guard let firstScore = firstScoreTextField.text, !firstScore.isEmpty else {return}
        guard let secondScore = secondScoreTextField.text, !secondScore.isEmpty else {return}
        guard let thirdScore = thirdScoreTextField.text, !thirdScore.isEmpty else {return}
        guard let fourthScore = fourthScoreTextField.text, !fourthScore.isEmpty else {return}
        guard let fifthScore = fifthScoreTextField.text, !fifthScore.isEmpty else {return}
        guard let sixthScore = sixthScoreTextField.text, !sixthScore.isEmpty else {return}
        guard let seventhScore = seventhScoreTextField.text, !seventhScore.isEmpty else {return}
        
        guard let first = Int16(firstScoreTextField.text ?? "0") else {return}
        guard let second = Int16(secondScoreTextField.text ?? "0") else {return}
        guard let third = Int16(thirdScoreTextField.text ?? "0") else {return}
        guard let fourth = Int16(fourthScoreTextField.text ?? "0") else {return}
        guard let fifth = Int16(fifthScoreTextField.text ?? "0") else {return}
        guard let sixth = Int16(sixthScoreTextField.text ?? "0") else {return}
        guard let seventh = Int16(seventhScoreTextField.text ?? "0") else {return}
        
        let playerScore = first + second + third + fourth + fifth + sixth + seventh
        
        if let player = player {
            PlayerController.shared.updatePlayer(player: player, name: playerName, score: playerScore, firstScore: first, secondScore: second, thirdScore: third, fourthScore: fourth, fifthScore: fifth, sixthScore: sixth, seventhScore: seventh)
        } else {
            PlayerController.shared.createPlayer(name: playerName, score: playerScore, firstScore: first)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func updateViews(player: Player) {
        self.title = player.name
        nameTextField.text = player.name
        firstScoreTextField.text = String(player.firstScore)
        secondScoreTextField.text = String(player.secondScore)
        thirdScoreTextField.text = String(player.thirdScore)
        fourthScoreTextField.text = String(player.fourthScore)
        fifthScoreTextField.text = String(player.fifthScore)
        sixthScoreTextField.text = String(player.sixthScore)
        seventhScoreTextField.text = String(player.seventhScore)
        
        if player.score >= 600 {
            scoreLabel.text = String(player.score)
            scoreLabel.textColor = .gray
        } else if player.score >= 450 {
            scoreLabel.text = String(player.score)
            scoreLabel.textColor = .red
        } else if player.score >= 300 {
            scoreLabel.text = String(player.score)
            scoreLabel.textColor = .orange
        } else if player.score >= 150 {
            scoreLabel.text = String(player.score)
            scoreLabel.textColor = .yellow
        } else {
            scoreLabel.text = String(player.score)
            scoreLabel.textColor = .green
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let first = Int16(firstScoreTextField.text ?? "0") else {return}
        guard let second = Int16(secondScoreTextField.text ?? "0") else {return}
        guard let third = Int16(thirdScoreTextField.text ?? "0") else {return}
        guard let fourth = Int16(fourthScoreTextField.text ?? "0") else {return}
        guard let fifth = Int16(fifthScoreTextField.text ?? "0") else {return}
        guard let sixth = Int16(sixthScoreTextField.text ?? "0") else {return}
        guard let seventh = Int16(seventhScoreTextField.text ?? "0") else {return}
        
        let playerScore = first + second + third + fourth + fifth + sixth + seventh
        scoreLabel.text = String(playerScore)
    }
    
   
}
