//
//  PlaylistTableViewController.swift
//  Playlist 2
//
//  Created by Spencer Curtis on 2/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        
        guard let name = playlistNameTextField.text else { return }
        
        PlaylistController.sharedController.addPlaylistWith(name: name)
        
        playlistNameTextField.text = ""
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedController.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.sharedController.playlists[indexPath.row]
        
        guard let songs = playlist.songs else { return UITableViewCell() }
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(songs.count) songs"
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            
            PlaylistController.sharedController.delete(playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // What road are we taking to get to our destination?
        if segue.identifier == "toPlaylistDetail" {
            
            // Get what we're passing
            // Get where we're passing it to

            guard let indexPath = tableView.indexPathForSelectedRow,
                let playlistTVC = segue.destination as? PlaylistDetailTableViewController else { return }
            
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            // Pass the playlist to the detailTVC
            playlistTVC.playlist = playlist
        }
        
        
        // What road are we taking to get to our destination?

        if segue.identifier == "toPlaylistDetail" {
            
            // Get what we're passing
            // Get where we're passing it to
            if let indexPath = tableView.indexPathForSelectedRow,
                let playlistTVC = segue.destination as? PlaylistDetailTableViewController {
                
                let playlist = PlaylistController.sharedController.playlists[indexPath.row]
                // Pass the playlist to the detailTVC
                playlistTVC.playlist = playlist
            }
        }
    }
}
