//
//  SongController.swift
//  Playlist 2
//
//  Created by Spencer Curtis on 2/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation

class SongController {
    
    static let sharedController = SongController()
    
    // Adding a song to a playlist
    
    func addSongWith(name: String, artist: String, to playlist: Playlist) {
        
        let _ = Song(title: name, artist: artist, playlist: playlist)
        
        
        
        PlaylistController.sharedController.saveToPersistentStore()
    }
    
    // Deleting a song from a playlist
    
    func delete(song: Song) {
        
        // Find the index of the song in the array of songs
        
        let moc = Stack.context
        
        moc.delete(song)
        
      
        
        PlaylistController.sharedController.saveToPersistentStore()
    }
}
