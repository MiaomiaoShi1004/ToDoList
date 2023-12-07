//
//  ViewController.swift
//  ToDoList
//
//  Created by Miaomiao Shi on 05/12/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // context is an instance of "NSManagedObjectContext", a core part of the COre Data Stack. It manages a collection of "NSManagedObject" instances(which are data records that you fetch, insert, delete, or modify)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
        forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    // ???
    private var models = [ToDoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "CoreData To Do List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    // Core Data
    func getAllitems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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

