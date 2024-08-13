//
//  ItemEditView.swift
//  ToDoList
//
//  Created by Eren on 13.08.2024.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    var item: ItemModel
    
    @State var editButtonPressed: Bool = false
    
    let detailsTextColor = Color("DetailsTextColor")
    
    init(item: ItemModel) {
           self.item = item
           _textFieldText = State(initialValue: item.title)
       }
    
    var body: some View {
        
        ScrollView {
            VStack {
                Label("Tarih: \(item.dateCreated, format: .dateTime)", systemImage: "calendar.circle")
                TextEditor(text: $textFieldText)
                                .frame(width: 350, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                                .border(Color.gray.opacity(0.3), width: 1)
                    
                
                
                Spacer(minLength: 10)
                
                Button("Kaydet".uppercased()) {
                    let updatedItem = item.updateTitle(newTitle: textFieldText)
                    listViewModel.updateItemTitle(item: updatedItem)
                    dismiss()
                    
                    

                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal, 13)
            
        }
        .navigationTitle("\(item.title.prefix(23).appending("..."))")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            //    editButtonPressed.toggle()
                if editButtonPressed {
                    
                }
            }
            }
            
        
    }
}



#Preview {
    NavigationStack {
        DetailsView(item: ItemModel(title: "This is the first item", isCompleted: false, dateCreated: .now, dateUpdated: .now)
                        //ItemModel(title: "This is the first item", isCompleted: false))
                    )
    }
}
