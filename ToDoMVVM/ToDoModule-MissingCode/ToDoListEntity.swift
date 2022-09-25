//
//  ToDoListEntity.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
struct ToDoCellViewModel {
    
    var todoName: String?
    var isCompleted: Bool?
}
struct ToDo {
    var id = UUID()
    var isCompleted:Bool
    var toDoName:String
}
