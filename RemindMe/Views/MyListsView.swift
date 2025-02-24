//
//  MyListsView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import SwiftUI

struct MyListsView: View {
    let myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack {
            if myLists.isEmpty {
                Spacer()
                Text("No Reminders found.")
            } else {
                ForEach(myLists, id: \.self) { myList in

                    NavigationLink {
                        MyListDetailView(myList: myList)
                            .navigationTitle(myList.name)
                    } label: {
                        VStack {
                            MyListCellView(myList: myList)
                                .frame(maxWidth: .infinity)
                                .padding(.leading, 10)
                                .font(.title3)
                        }
                    }

                        
                        Divider() 
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}

//#Preview {
//    MyListsView()
//}
