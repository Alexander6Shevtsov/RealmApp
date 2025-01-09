//
//  TaskList.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 04.01.2025.
//

import Foundation
import RealmSwift
// Списки
final class TaskList: Object {
    @Persisted var title = ""
    @Persisted var date = Date()
    @Persisted var tasks = List<Task>()
}
// Задачи в списках
final class Task: Object {
    @Persisted var title = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isComplete = false
}
