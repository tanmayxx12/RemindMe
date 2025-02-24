//
//  RemindMeApp.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import SwiftUI

@main
struct RemindMeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.container.viewContext)
        }
    }
}
