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
         
            ScrollView {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    //ScrollView {
                        Section("Bugün") {
                             //   List {
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
                              //  }
                            //    .listStyle(InsetGroupedListStyle())
                            }
                            
                            Section("Dün") {
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
                                .listStyle(InsetGroupedListStyle())
                            }
                    }
              //  }
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
            .environmentObject(ListViewModel())

    }
}




