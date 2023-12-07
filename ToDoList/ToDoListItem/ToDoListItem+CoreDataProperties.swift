//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoList
//
//  Created by Miaomiao Shi on 06/12/2023.
//
//

import Foundation
import CoreData


extension ToDoListItem {
    // To query out all of the to do list items from we saved in core data
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createAt: Date?

}

extension ToDoListItem : Identifiable {

}
