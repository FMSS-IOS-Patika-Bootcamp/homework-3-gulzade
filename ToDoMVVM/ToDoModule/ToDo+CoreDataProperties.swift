//
//  ToDo+CoreDataProperties.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }


    @NSManaged public var isCompleted: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var toDoName: String?

}

extension ToDo : Identifiable {

}
