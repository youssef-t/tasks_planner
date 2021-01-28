//
//  ViewControllerAllTasks.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 20/01/2021.
//

import UIKit
import CoreData

class ViewControllerAllTasks: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        let row = indexPath.row
        if row%2 == 0{
            cell.backgroundColor = UIColor.systemGray4
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        let currentItem = managedObjects[row]
        let task_name_core_data = currentItem.value(forKeyPath: "name") as? String
        cell.task_name.text = task_name_core_data
        
        let importance_core_data = currentItem.value(forKeyPath: "importance") as? String
        cell.importance.text = importance_core_data
        
        let date_core_data = currentItem.value(forKeyPath: "date_deadline") as? Date
        let date_formatter = DateFormatter()
        date_formatter.dateFormat = "dd-MM-yyyy  HH:mm"
        let date_string = date_formatter.string(from: date_core_data!)
        cell.date.text = date_string
        
        if cell.importance.text == "high" {
            cell.backgroundColor = UIColor.red
        }
        else if cell.importance.text == "low" {
            cell.backgroundColor = UIColor.green
        }
        else if cell.importance.text == "medium" {
            cell.backgroundColor = UIColor.yellow
        }
        
        
        return cell
    }
    
    //delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("size managedObjects\(managedObjects.count)")
            managedObjects.remove(at: indexPath.row)
            do {
                try managedObjectContext!.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("indexPath.row: \(indexPath.row)")
            //deleteData(index: indexPath.row)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadData()
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
                
    }

    override func viewWillAppear(_ animated: Bool) {
        tasksTableView.reloadData()
    }
    
    //CORE DATA
    // Initialization of Core Data
    // Done in the first view
    
    // Load the data at application launch
    func loadData(){
        // Step 1: Create a fetch request meeting the criteria "Item".
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        // Step 2: Fetch and store the data into the managed objects
        do {
            // Returns an array
            managedObjects = try managedObjectContext!.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }    }

    
    func deleteData (index: Int) {
        // Delete an item
        print("size managedObjects\(managedObjects.count)")
        managedObjectContext!.delete(managedObjects[index])
        
        do {
            try managedObjectContext!.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    /*
    // MARK: - Navigation
   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     
        // Pass the selected object to the new view controller.
    }
    */

}
