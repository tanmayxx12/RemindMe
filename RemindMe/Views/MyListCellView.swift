//
//  MyListCellView.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import SwiftUI

struct MyListCellView: View {
    let myList: MyList
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal.circle.fill")
                .foregroundStyle(Color(myList.color))
            
            Text(myList.name)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .opacity(0.4)
                .padding(.trailing, 10)
        }
    }
}

#Preview {
    MyListCellView(myList: PreviewData.myList)
}
