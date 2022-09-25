//
//  AddNewTaskViewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation

class AddNewTaskViewModel {
    var toDoName: String
    var isCompleted:Bool
    var id:UUID
    init(toDoName: String, isCompleted:Bool, id:UUID) {
        self.toDoName = toDoName
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func saveTask(completion: @escaping (Bool) -> Void) {
        CoreDataManager.shared.saveToDo(toDoName: self.toDoName, isCompleted: self.isCompleted, id: self.id, completion: completion)
    }
}
