//
//  CoreDataStack.swift
//  foursAndThrees
//
//  Created by Mathias on 6/19/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import CoreData
// Using an enum because it is light weight
enum CoreDataStack {
    // Creating a static stored property for our container
    static let container: NSPersistentContainer = {
        // Initializing the container and maatching the name to our application name "this is required"
        let container = NSPersistentContainer(name: "foursAndThrees")
        // Loading our persisitent stores, this completes our core data stack
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
        return container
    }()
    
    // Creating a static var to access our NSManagedObjectContext that we can use for out objects context
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
