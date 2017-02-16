//
//  Stack.swift
//  Playlist 2
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation

import CoreData

class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Playlist 2")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
