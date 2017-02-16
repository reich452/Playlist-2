//
//  Song + Convenience.swift
//  Playlist 2
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData


extension Song {
    
    @discardableResult convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = Stack.context) {
        
        // This is saying that we want to put this new instance of Song in a specific managed object context (sandbox or scratchpad)
        self.init(context: context)
        
        // Then we just set the properties of the Song like with any other initailizer.
        self.title = title
        self.artist = artist
        self.playlist = playlist
        
        
        
    }
    
}
