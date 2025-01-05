//
//  AlertControllerBuilder.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 05.01.2025.
//

import UIKit

/**
 Для создания `UIAlertController` с разными полями в зависимости от контекста редактирования (список задач или отдельная задача) можно использовать паттерн проектирования "Строитель" (Builder pattern). Этот паттерн позволяет создавать сложные объекты с помощью последовательного вызова методов строителя, предоставляя гибкость в конфигурировании объекта.
 */
final class AlertControllerBuilder {
    private let alertController: UIAlertController
    
    /**
         Инициализирует экземпляр `AlertControllerBuilder` с указанным заголовком и сообщением.
         
         - Parameters:
           - title: Заголовок предупреждения.
           - message: Текст сообщения предупреждения.
         */
    init(title: String, message: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    /**
         Создает текстовое поле с указанным текстом и плейсхолдером.
         
         - Parameters:
            - placeholder: Определяет плейсхолдер для текстового поля
            - text: Определяет текст отображения в текстовом поле
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    func setTextField(withPlaceholder placeholder: String, andText text: String?) -> AlertControllerBuilder {
        alertController.addTextField { textField in // обращаемся к экземпляру и добавляем текстовое поле
            textField.placeholder = placeholder // задаем плейсхолдер из параметра
            textField.text = text // задаем текст, который берем из параметра
        }
        return self // возвращаем класс AlertControllerBuilder целиком
    }
    
    /**
         Добавляет действие в `UIAlertController`.
         
         - Parameters:
           - title: Заголовок действия.
           - style: Стиль действия.
           - handler: Замыкание, вызываемое при выборе действия. Принимает заголовок задачи и заголовок заметки в качестве параметров.
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    @discardableResult // метод с игнорируемым рузультатом
    func addAction(title: String, style: UIAlertAction.Style, handler: ((String, String) -> Void)? = nil) -> AlertControllerBuilder {
            let action = UIAlertAction(title: title, style: style) { [weak alertController] _ in
                guard let title = alertController?.textFields?.first?.text else { return } // извлекаем значение из текствого поля
                guard !title.isEmpty else { return } // проверка на пустоту
                let note = alertController?.textFields?.last?.text // извлекаем значение из второго текствого поля
                handler?(title, note ?? "") // передаем в хендлер, если note пуст передаем пустую строку
            }
            alertController.addAction(action) // все это добавляем к aC
            return self
        }
    
    /**
         Создает и возвращает экземпляр `UIAlertController`, созданный на основе установленных параметров и действий.
         
         - Returns: Экземпляр `UIAlertController`.
         */
    func build() -> UIAlertController {
        return alertController
    }
}
