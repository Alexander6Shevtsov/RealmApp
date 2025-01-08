//
//  TaskList.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 04.01.2025.
//

import Foundation
// Списки
final class TaskList {
    var title = ""
    var date = Date()
    var tasks: [Task] = []
}
// Задачи в списках
final class Task {
    var title = ""
    var note = ""
    var date = Date()
    var isComplete = false
}
