//
//  ViewControllerAllTasks.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 20/01/2021.
//

import UIKit

class ViewControllerAllTasks: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //les tasks enregistrés
        return managedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allTasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
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
        cell.date.text = date_string
              
        	        
        let importance_core_data = currentItem.value(forKeyPath: "importance") as? String
        cell.importance.text = importance_core_data
        
        return cell
    }
    
    
    @IBOutlet weak var allTasksTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
