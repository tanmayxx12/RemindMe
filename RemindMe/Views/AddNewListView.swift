//
//  AddNewListView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import SwiftUI

struct AddNewListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var selectedColor: Color = .yellow
    let onSave: (String, UIColor) -> Void
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(selectedColor)
                        .padding(.bottom)
                    
                    TextField("List Name", text: $name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(10)
                        
                }
                .padding(20)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                ColorPickerView(selectedColor: $selectedColor)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New List")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        // Method to save the list into the data base
                        onSave(name, UIColor(selectedColor))
                        dismiss()
                    }
                    .disabled(!isFormValid)
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        AddNewListView(onSave: { (_, _) in })
    }
}
