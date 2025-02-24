//
//  CoreDataProvider.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import Foundation


class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let container: NSPersistentContainer
    
    private init() {
        // Register transformers(UIColorTransformer)
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        container = NSPersistentContainer(name: "MyList")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("There was an error initializing RemindMeModel: \(error.localizedDescription)")
            }
        }
        
    }
    
}

