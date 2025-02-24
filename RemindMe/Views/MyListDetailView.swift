//
//  MyListDetailView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import SwiftUI

struct MyListDetailView: View {
    let myList: MyList
    @State private var title: String = ""
    @State private var openAddReminder: Bool = false
    var isFormValid: Bool {
        !title.isEmpty
    }
    
    var body: some View {
        VStack {
            // Display the list:
            
            
            Button {
                openAddReminder = true
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.headline)
                    Text("New Reminder")
                        .font(.headline)
                }
            }
            .foregroundStyle(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .alert("New Reminder", isPresented: $openAddReminder) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) {}
            Button("Done") {
                if isFormValid {
                    // Save reminder to MyList
                    do {
                        try RemindMeService.saveReminderToList(myList: myList, reminderTitle: title)
                    } catch {
                        print("There was an error saving the reminder: \(error.localizedDescription)")
                    }
                }
            }
                .disabled(!isFormValid)
        }
    }
}

#Preview {
    MyListDetailView(myList: PreviewData.myList)
}
