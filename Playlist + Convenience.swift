//
//  Playlist + Convenience.swift
//  Playlist 2
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation

import CoreData

extension Playlist {
    
    
    @discardableResult convenience init(name: String, context: NSManagedObjectContext = Stack.context) {
        
        // This is saying that we want to put this new instance of Song in a specific managed object context (sandbox or scratchpad)
        
        self.init(context: context) // Requires a context 
        
        self.name = name 
        
    }
    
    
}
