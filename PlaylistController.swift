//
//  PlaylistController.swift
//  Playlist 2
//
//  Created by Spencer Curtis on 2/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    
    static let sharedController = PlaylistController()
    private let playlistsKey = "playlistsKey"
    
    // CREATE
    
    
    // Going straight to moc - context: Stack.context 
    
    func addPlaylistWith(name: String) {
        let _ = Playlist(name: name, context: Stack.context)
        
        
        saveToPersistentStore()
    }
    
    // READ - Computed property will always run when playlist is called
    
    var playlists: [Playlist] {
        
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()  // Specific part of MOC
        
        let moc = Stack.context
        
        do {
           return try moc.fetch(request)
            
        } catch {
            print("Error loading playlists from managed object context")
            return []
        }
    }

    
    // All of the food on the table.
    

    
    // UPDATE
    
    
    // DELETE
    
    func delete(playlist: Playlist) {
        // We need to get the index of the playlist that we pass in from the array of playlists in order to delete the right playlist
        
        let moc = Stack.context
        
        moc.delete(playlist)   // Going to our MOC and deleting an object
        
                                // Next
        saveToPersistentStore() // Going to our Persisten Store - Deleting one less object
    }
    
    // Saving - Putting the container of food in the fridge for safe keeping until we want to take it out and eat it.
    
    func saveToPersistentStore() {
        
        let moc = Stack.context
        
        do {
            try moc.save()
        } catch {
            print("There was an error saving to the persistnet store")
        }
     
        
    }
    
}
