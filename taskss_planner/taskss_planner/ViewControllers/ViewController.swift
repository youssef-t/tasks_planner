//
//  ViewController.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 11/01/2021.
//

import UIKit
import CoreData

var managedObjectContext:NSManagedObjectContext?
var managedObjects:[NSManagedObject] = []

class ViewController: UIViewController {

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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCoreData()
        loadData()
        print(managedObjects.count)
        //(UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all

    }
    
    @IBOutlet weak var check_tasks: UIButton!
    
    @IBAction func check_today_tasks(_ sender: Any) {
    }
}

