//
//  ToDoItem.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/10/23.
//

import Foundation

struct TodoItem: Identifiable  {
    var id = UUID().uuidString
    var title: String
    var notes: String
}
