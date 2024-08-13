//
//  ListRowView.swift
//  ToDoList
//
//  Created by Eren on 9.08.2024.
//

import SwiftUI

struct ListRowView: View {
    
    @State var navigateToEditView: Bool = false
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .padding(.leading,7)
            
            Text(item.title)
            Spacer()
            Divider()
                .frame(width: 1.5, height: 20)
                .background(Color.gray)
            
            Button(action: {
                navigateToEditView = true
            }, label: {
                Image(systemName: "pencil.tip.crop.circle.badge.plus.fill")
                    .foregroundStyle(.green)
                    .padding(.horizontal, 7)
            })
            .background(
                            NavigationLink(
                                destination: ItemEditView(item: item),  // Düzenlenecek öğeyi gönderiyoruz
                                isActive: $navigateToEditView,
                                label: { EmptyView() }
                            )
                            .hidden()
                        )
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
  Group {
    ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
    ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
  }
  .previewLayout(.sizeThatFits)
}
