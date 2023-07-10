//
//  ToDoItem.swift
//  ThingsClone
//
//  Created by Gan Tu on 7/10/23.
//

import Foundation

class TodoItem: Identifiable, ObservableObject  {
    var id: String
    @Published var title: String
    @Published var notes: String
    var isToday: Bool = Bool.random()
    
    init() {
        self.id = UUID().uuidString
        self.title = ""
        self.notes = ""
    }

    init(id: String, title: String, notes: String) {
        self.id = id
        self.title = title
        self.notes = notes
    }
    
    
    init(title: String, notes: String) {
        self.id = UUID().uuidString
        self.title = title
        self.notes = notes
    }
}
