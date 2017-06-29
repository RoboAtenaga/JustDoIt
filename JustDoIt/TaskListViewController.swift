//
//  TaskListViewController.swift
//  JustDoIt
//
//  Created by Ogheneorobo on 6/13/17.
//  Copyright © 2017 Ogheneorobo. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tblTasks: UITableView!
    
    var tasks: [Task] = []
    //var selectedIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tblTasks.tableFooterView = UIView()
        
        //tasks = createTasks()
        
        tblTasks.dataSource = self
        tblTasks.delegate = self
    }
    
    // this function gets called every time the VC will show up, not only at first run
    override func viewWillAppear(_ animated: Bool) {
        getTasksFromCoreData()
        tblTasks.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        if task.isImportant{
            cell.textLabel?.text = "❗️\(task.name!)"
        }
        else{
            cell.textLabel?.text = task.name!
        }
        
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "deleteSegue", sender: task)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
//    func createTasks() -> [Task] {
//        var tasks: [Task] = []
//        let task1 = Task(name: "Do laundry", isImportant: true)
//        let task2 = Task(name: "Read a book", isImportant: false)
//        let task3 = Task(name: "Buy fruits", isImportant: true)
//        tasks.append(task1)
//        tasks.append(task2)
//        tasks.append(task3)
//        return tasks
//    }
    
    func getTasksFromCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("Error! Oops!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addSegue"{
//            let nextVC = segue.destination as! AddTaskViewController
//            nextVC.previousVC = self
//        }
//        if segue.identifier == "deleteSegue"{
//            let nextVC = segue.destination as! CompleteTaskViewController
//            nextVC.task = sender as! Task
//            nextVC.previousVC = self
//        }
        
        // Using CoreData
        if segue.identifier == "deleteSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    @IBAction func addClicked(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
}

