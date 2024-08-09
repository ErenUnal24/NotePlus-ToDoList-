//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Eren on 9.08.2024.
//

import SwiftUI

/*
    - MVVM Architecture -
 
    Model - data point
    View  - UI
    ViewModel - manages Models for View
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
