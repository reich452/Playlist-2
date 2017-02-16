//
//  PlaylistDetailTableViewController.swift
//  Playlist 2
//
//  Created by Spencer Curtis on 2/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class PlaylistDetailTableViewController: UITableViewController {

    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    var playlist: Playlist? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = playlist?.name
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songName = songNameTextField.text, let artistName = artistNameTextField.text, let playlist = self.playlist else { return }
        
        SongController.sharedController.addSongWith(name: songName, artist: artistName, to: playlist)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let songs = playlist?.songs else { return 0 }
        
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let playlist = playlist, let song = playlist.songs?.object(at: indexPath.row) as? Song else { return UITableViewCell() }
        
    
        cell.textLabel?.text = song.title
        
        cell.detailTextLabel?.text = song.artist

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return }
            
            
            SongController.sharedController.delete(song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
