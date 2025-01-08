//
//  TasksViewController.swift
//  RealmApp
//
//  Created by Alexander Shevtsov on 04.01.2025.
//

import UIKit

final class TasksViewController: UITableViewController {
    
    var taskList: TaskList! // список задач, иниц при переходе
    // распределяем по массивам: текущие и выполненные
    private var currentTasks: [Task] = []
    private var completedTasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = taskList.title
        // кнопка добавления
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed)
        )                            // добавление кнопок в NB с права
        navigationItem.rightBarButtonItems = [addButton, editButtonItem]
    }
    
    // MARK: - UITableViewDataSource
    // определяем 2 секции
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    // кол строк в секциях зависит от массива
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currentTasks.count : completedTasks.count
    }
    // заголовки если секций 0 -> current иначе completed
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "CURRENT TASKS" : "COMPLETED TASKS"
    }
    // отображение контента
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) // создаем ячейку
        var content = cell.defaultContentConfiguration() // создаем контент
        let task = indexPath.section == 0 ? currentTasks[indexPath.row] : completedTasks[indexPath.row] // извлекаем task
        content.text = task.title
        content.secondaryText = task.note
        cell.contentConfiguration = content
        return cell
    }
    
    @objc private func addButtonPressed() {
        showAlert()
    }
}

extension TasksViewController {
    private func showAlert(with task: Task? = nil, completion: (() -> Void)? = nil) {
        let alertBuilder = AlertControllerBuilder(
            title: task != nil ? "Edit Task" : "New Task",
            message: "What do you want to do?"
        )
        
        alertBuilder
            .setTextField(withPlaceholder: "Task Title", andText: task?.title)
            .setTextField(withPlaceholder: "Note Title", andText: task?.note)
            .addAction(
                title: task != nil ? "Update Task" : "Save Task",
                style: .default
            ) { [weak self] taskTitle, taskNote in
                if let task, let completion {
                    // TODO: - edit task
                    return
                }
                self?.save(task: taskTitle, withNote: taskNote)
            }
            .addAction(title: "Cancel", style: .destructive)
        
        let alertController = alertBuilder.build()
        present(alertController, animated: true)
    }
    
    private func save(task: String, withNote note: String) {
        
    }
}
