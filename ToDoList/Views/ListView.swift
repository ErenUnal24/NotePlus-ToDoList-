//
//  ListView.swift
//  ToDoList
//
//  Created by Eren on 9.08.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.bouncy()) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Yapılacaklar 📝")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Ekle") {
                    AddView()
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton() 
                    
                
                    
                    
            }
        }
    }
   
}


#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}




