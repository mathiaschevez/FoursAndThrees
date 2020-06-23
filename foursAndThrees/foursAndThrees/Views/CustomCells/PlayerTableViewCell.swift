//
//  PlayerTableViewCell.swift
//  foursAndThrees
//
//  Created by Mathias on 6/20/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    func updateViews(player: Player) {
        
        playerNameLabel.text = player.name
        playerScoreLabel.text = String(player.score)
        
        if player.score >= 600 {
            guard let playerName = player.name else {return}
            playerNameLabel.text = playerName + " really sucks"
            playerScoreLabel.textColor = .gray
        } else if player.score >= 450{
            playerScoreLabel.textColor = .red
            guard let playerName = player.name else {return}
            playerNameLabel.text = playerName  + " sucks"
        } else if player.score >= 300 {
            playerScoreLabel.textColor = .orange
        } else if player.score >= 150 {
            playerScoreLabel.textColor = .yellow
        } else {
            playerScoreLabel.textColor = .green
        }
        
        
    }
}
