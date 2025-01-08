//
//  DataManager.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 04.01.2025.
//

import Foundation
// Предустановленные таски
final class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        let milk = Task()
        milk.title = "Milk"
        milk.note = "2L"
        
//        let apples =
        
        shoppingList.tasks.append(milk)
    }
}
