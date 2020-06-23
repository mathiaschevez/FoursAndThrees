//
//  PlayerListTableViewController.swift
//  foursAndThrees
//
//  Created by Mathias on 6/20/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class PlayerListTableViewController: UITableViewController {
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlayerController.shared.players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell else {return UITableViewCell()}
        let player = PlayerController.shared.players[indexPath.row]
        cell.updateViews(player: player)
    
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let player = PlayerController.shared.players[indexPath.row]
            PlayerController.shared.removePlayer(playerToDelete: player)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            guard let destinationVC = segue.destination as? PlayerDetailViewController else {return}
            let playerToSend = PlayerController.shared.players[indexPath.row]
            destinationVC.player = playerToSend
        }
    }
}
