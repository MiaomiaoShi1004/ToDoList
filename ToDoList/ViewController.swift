//
//  ViewController.swift
//  ToDoList
//
//  Created by Miaomiao Shi on 05/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // context is an instance of "NSManagedObjectContext", a core part of the COre Data Stack. It manages a collection of "NSManagedObject" instances(which are data records that you fetch, insert, delete, or modify)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getAllitems() {
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest())
        }
        catch {
            // error
        }
    }
    
    func createItem(name: String) {
        // create a new item
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createAt = Date()
        
        // save the changes in the databse
        do {
            try context.save()
        } catch {
            
        }
        
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
}

