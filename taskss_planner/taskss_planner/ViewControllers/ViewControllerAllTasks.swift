//
//  ViewControllerAllTasks.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 20/01/2021.
//

import UIKit
import CoreData

class ViewControllerAllTasks: UIViewController, UITableViewDataSource {
    
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
        
        return cell
    }
        
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //les tasks enregistrés
        return managedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allTasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        /*if managedObjects.count > 0 {
            let row = indexPath.row
            
            if row%2 == 0{
                cell.backgroundColor = UIColor.systemGray
            }
            else {
                cell.backgroundColor = UIColor.white
            }
            let currentItem = managedObjects[row]
            let task_name_core_data = currentItem.value(forKeyPath: "name") as? String
            cell.task_name.text = task_name_core_data
            
            let date_core_data = currentItem.value(forKeyPath: "date_deadline") as? Date
            let date_formatter = DateFormatter()
            date_formatter.dateFormat = "dd-MM-yyyy"
            let date_string = date_formatter.string(from: date_core_data!)
            cell.date.text = "date !!!!"
                  
                        
            let importance_core_data = currentItem.value(forKeyPath: "importance") as? String
            cell.importance.text = importance_core_data
            
            return cell
 
        }
        
        //if there is not any data
        cell.task_name.text = "No Data"
        cell.date.text = "No data"
        cell.importance.text = "No data"
        */
        
        return cell
    }
    */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadData()
        tasksTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
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

    /*
    // MARK: - Navigation
   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     
        // Pass the selected object to the new view controller.
    }
    */

}
