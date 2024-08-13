//
//  ItemModel.swift
//  ToDoList
//
//  Created by Eren on 9.08.2024.
//

import Foundation

//Immutable Struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    func updateTitle(newTitle: String) -> ItemModel {
        
        return ItemModel(id: id, title: newTitle, isCompleted: false)
    }
}
