//
//  RemindMeService.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import Foundation
import UIKit

class RemindMeService {
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.container.viewContext
    }
    
    // Function to save the List Name and Color (throws)
    static func saveMyList(_ name: String, _ color: UIColor) throws {
        let myList = MyList(context: viewContext)
        myList.name = name
        myList.color = color
        
        save()
    }
    
    static func save() {
        do {
            try viewContext.save()
            print("Data saved Successfully")
        } catch {
            print("There was an error saving the data: \(error.localizedDescription)")
        }
    }
    
    static func saveReminderToList(myList: MyList, reminderTitle: String) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = reminderTitle
        myList.addToReminders(reminder)
        save() 
    }
    
}
