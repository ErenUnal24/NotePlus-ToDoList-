//
//  ItemEditView.swift
//  ToDoList
//
//  Created by Eren on 13.08.2024.
//

import SwiftUI

struct ItemEditView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    var item: ItemModel

    
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField("Edit Alanı", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button("Kaydet".uppercased()) {
                    let updatedItem = item.updateTitle(newTitle: textFieldText)
                    listViewModel.updateItemTitle(item: updatedItem)
                    dismiss()
//                    listViewModel.updateItemTitle(item: item)
//                    dismiss()
/*
                   let updatedItem = item.updateTitle(newTitle: textFieldText) // Başlık güncelleniyor
                   listViewModel.updateItem(item: updatedItem)
               }
 */
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(13)
            
        }
        .navigationTitle("Edit Ekranı")
        


    }


    
    
}

#Preview {
    NavigationStack {
        ItemEditView(item: ItemModel(title: "This is the first item", isCompleted: false))
    }
}
