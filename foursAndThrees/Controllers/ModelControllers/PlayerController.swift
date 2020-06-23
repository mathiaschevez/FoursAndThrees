//
//  PlayerController.swift
//  foursAndThrees
//
//  Created by Mathias on 6/20/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import CoreData

class PlayerController {
    static let shared = PlayerController()
    
    var players: [Player] {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        return(try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func createPlayer(name: String, score: Int16, firstScore: Int16) {
        if name == "Blaine" {
            Player(name: "Trash", score: score, firstScore: firstScore)
        } else if name == "Trash" {
            Player(name: "Blaine", score: score, firstScore: firstScore)
        } else if name == "Fernanda" {
            Player(name: "Ferdinand", score: score, firstScore: firstScore)
        } else {
            Player(name: name, score: score, firstScore: firstScore)
        }
        saveToPersistentStore()
    }
    
    func updatePlayer(player: Player, name: String, score: Int16, firstScore: Int16, secondScore: Int16, thirdScore: Int16, fourthScore: Int16, fifthScore: Int16, sixthScore: Int16, seventhScore: Int16) {
        
        if player.name == "Blaine" {
            player.name = "Trash"
        } else if player.name == "Trash" {
            player.name = "Blaine"
        } else if player.name == "Fernanda" {
            player.name = "Ferdinand"
        } else {
            player.name = name
        }
        
        player.score = score
        player.firstScore = firstScore
        player.secondScore = secondScore
        player.thirdScore = thirdScore
        player.fourthScore = fourthScore
        player.fifthScore = fifthScore
        player.sixthScore = sixthScore
        player.seventhScore = seventhScore
        saveToPersistentStore()
    }
    
    func removePlayer(playerToDelete: Player) {
        playerToDelete.managedObjectContext?.delete(playerToDelete)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
