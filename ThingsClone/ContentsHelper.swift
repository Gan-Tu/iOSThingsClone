//
//  ContentsHelper.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import Foundation
import LoremSwiftum

func GenerateTitle() -> String {
    Lorem.title.capitalized
}

func GenerateNotes() -> String {
    if Int.random(in: 0...2) < 1 {
        return ""
    } else {
        return Lorem.paragraph
    }
}

let section1Items: [TodoItem] = [
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
]

let section2Items: [TodoItem] = [
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
]

let section3Items: [TodoItem] = [
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
    TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
]
