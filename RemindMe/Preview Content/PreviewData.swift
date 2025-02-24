//
//  PreviewData.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import Foundation

class PreviewData {
    static var myList: MyList {
        let viewContext = CoreDataProvider.shared.container.viewContext
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyList() 
    }
}
