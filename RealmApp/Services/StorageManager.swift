//
//  StorageManager.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 04.01.2025.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    // MARK: - Task List
    func fetchTaskList() -> [TaskList] {
        []
    }
    
    func save(_ taskList: [TaskList]) {
        
    }
    
    func save(_ taskList: String, completion: (TaskList) -> Void) {
        
    }
    
    func delete(_ taskList: TaskList) {
        
    }
    
    func edit(_ taskList: TaskList, newValue: String) {
        
    }
    
    func done(_ taskList: TaskList) {
        
    }
    
    // MARK: - Tasks
    func save(_ task: String, withNote note: String, to taskList: TaskList, completion: (Task) -> Void) {
        
    }
}
