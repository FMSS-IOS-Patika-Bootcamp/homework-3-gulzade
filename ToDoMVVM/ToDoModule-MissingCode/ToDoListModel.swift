//
//  ToDoListModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import CoreData
import UIKit

protocol ToDoListModelProtocol: AnyObject{
    func didDataFetchProcessFinish2(_ isSuccess: Bool)
}
let appDelegate = UIApplication.shared.delegate as! AppDelegate
class ToDoListModel {
    
    let context = appDelegate.persistentContainer.viewContext
    weak var delegate: ToDoListModelProtocol?   //Protocol delegate
    
    var todos: [NSManagedObject] = []
    
    func saveData(toDoName: String){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          
          // 1
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          // 2
          let entity =
            NSEntityDescription.entity(forEntityName: "ToDo",
                                       in: managedContext)!
          
          let todo = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
          
          // 3
          todo.setValue(toDoName, forKey: "TodoName")
        delegate?.didDataFetchProcessFinish2(true)
          // 4
          do {
            try managedContext.save()
            todos.append(todo)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
        
       
    }
}
