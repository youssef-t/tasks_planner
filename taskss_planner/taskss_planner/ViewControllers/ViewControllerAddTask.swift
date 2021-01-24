//
//  ViewControllerAddTask.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 20/01/2021.
//

import UIKit
import CoreData



class ViewControllerAddTask: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    let identifiant = "itemCell"
    
    var task_name: String? = "A task"
    
    let importance: [String] = ["low", "medium", "high"]
    var selected_importance: String = "low"
    
    var selected_date: Date = Date.init()
    

    
    @IBOutlet weak var task_name_label: UILabel!
    @IBOutlet weak var task_name_field: UITextField!
    @IBOutlet weak var to_do_before_label: UILabel!
    @IBOutlet weak var to_do_before: UIDatePicker!
    @IBOutlet weak var importance_label: UILabel!
    @IBOutlet weak var importance_picker: UIPickerView!
    @IBOutlet weak var add_task_button: UIButton!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return importance.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return importance[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected_importance = importance[row]
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        task_name = task_name_field.text
        textField.resignFirstResponder()
        return true
    }
    

    @IBAction func datePickerEditingEnded(_ sender: UIDatePicker) {
        selected_date = to_do_before.date
    }
    /*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        task_name = textField.text!
    }
    */
    
    @IBAction func addTask(_ sender: UIButton) {
        task_name = task_name_field.text
        print(task_name!)
        saveData(name: task_name!, importance: selected_importance, date_deathline: selected_date)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        importance_picker.dataSource = self
        importance_picker.delegate = self
        
        task_name_field.delegate = self
        
        //initCoreData()
        //loadData()
        
        
    }
    
    //CORE DATA
    // Initialization of Core Data
    func initCoreData() {
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }
    
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
    
    
    func saveData(name: String, importance: String, date_deathline: Date) {
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Task", in: managedObjectContext!)!
        let currentItem = NSManagedObject(entity: entity, insertInto: managedObjectContext!)
        // 3
        currentItem.setValue(name, forKeyPath: "name")
        currentItem.setValue(importance, forKeyPath: "importance")
        currentItem.setValue(date_deathline, forKeyPath: "date_deadline")

        // 4
        do {
            try managedObjectContext!.save()
            managedObjects.append(currentItem)
            print("DATA ADDED")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
}
