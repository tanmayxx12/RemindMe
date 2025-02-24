//
//  ContentView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
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
                }
            }
            
        }
        
        
    }
}

#Preview {
    HomeView()
}
