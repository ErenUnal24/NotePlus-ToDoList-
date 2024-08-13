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
    let dateCreated: Date
    let dateUpdated: Date
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, dateCreated: Date, dateUpdated: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dateCreated = .now
        self.dateUpdated = dateUpdated
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, dateCreated: dateCreated, dateUpdated: .now)
    }
    
    func updateTitle(newTitle: String) -> ItemModel {
        
        return ItemModel(id: id, title: newTitle, isCompleted: false, dateCreated: dateCreated, dateUpdated: .now)
    }
}
