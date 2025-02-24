//
//  MyList+CoreDataProperties.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import Foundation
import UIKit

extension MyList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }
    
    @NSManaged public var name: String
    @NSManaged public var color: UIColor
    
}

extension MyList: Identifiable {
    
}

// MARK: - Generated Accessors for notes
extension MyList {
    
}
