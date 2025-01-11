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
    
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        // так не писать!
        let moviesList = TaskList(
            value: [
                "Movies List",
                Date(),
                [
                    ["Best film ever"],
                    ["The best of the best", "Must have", Date(), true]
                ]
            ]
        )
        
        let milk = Task() // создание экземпляра
        milk.title = "Milk" // присваивание значения для 1 свойства
        milk.note = "2L" // для второго
        // можно проще с параметром value
        let apples = Task(value: ["Apples", "2Kg"])
        // через словарь выборочные параметры
        let bread = Task(value: ["title" : "Bread", "isComplete" : true])
        
        shoppingList.tasks.append(milk) // добавляем в коллекцию списка по одному
        // сразу несколько
        shoppingList.tasks.insert(contentsOf: [apples, bread], at: 1)
        
        // чтоб загрузка данных не тормозила интерфейс, выполняем асинхронно
        DispatchQueue.main.async { [unowned self] in
            storageManager.save([shoppingList, moviesList]) // сахранение данных
            completion()
        }
    }
}
