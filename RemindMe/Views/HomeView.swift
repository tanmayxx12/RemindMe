//
//  ContentView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import CoreData
import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: []) private var myListResults: FetchedResults<MyList>
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
//                List {
//                    ForEach(myListResults, id: \.self) { list in
//                        Text(list.name)
//                    }
//                }
//                .listStyle(.plain)
                MyListsView(myLists: myListResults)
                
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Text("Add List")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
            }
            .sheet(isPresented: $isPresented) {
                AddNewListView { name, color in
                    // Save the list to the database
                    do {
                        try RemindMeService.saveMyList(name, color)
                    } catch {
                        print("Error saving the list: \(error.localizedDescription)")
                    }
                   
                }
            }
            
        }
        
        
    }
}

#Preview {
    HomeView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.container.viewContext)
}
