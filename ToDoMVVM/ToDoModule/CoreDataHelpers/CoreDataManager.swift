//
//  CoreDataManager.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    func deleteTask(todo t: ToDo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        
        do {
            let context = persistentContainer.viewContext
            let result = try context.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                context.delete(todo)
                saveContext()
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func completeTask(todo t: ToDo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
      
       
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                todo.isCompleted = true
                saveContext()
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getAllTodos () -> [ToDo] {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        let firstSort = NSSortDescriptor(key: #keyPath(ToDo.toDoName), ascending: true)
        let secondSort = NSSortDescriptor(key: #keyPath(ToDo.isCompleted), ascending: false)

        request.sortDescriptors = [firstSort, secondSort]
        var todos = [ToDo]()
        
        do {
            todos = try persistentContainer.viewContext.fetch(request)
        } catch let err {
            print(err.localizedDescription)
        }
        
        return todos
    }
    
    func saveToDo(toDoName: String, isCompleted: Bool, id: UUID , completion: @escaping (Bool) -> Void) {
        let todo = ToDo(context: persistentContainer.viewContext)
        todo.toDoName = toDoName
        todo.isCompleted = isCompleted
        todo.id = UUID()
        saveContext()
        completion(true)
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoMVVM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
