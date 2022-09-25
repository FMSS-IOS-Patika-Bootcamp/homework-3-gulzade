//
//  ToDoModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObjectContext {
    static var current : NSManagedObjectContext {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
