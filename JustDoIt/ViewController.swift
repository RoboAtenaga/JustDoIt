//
//  ViewController.swift
//  JustDoIt
//
//  Created by Ogheneorobo on 6/13/17.
//  Copyright © 2017 Ogheneorobo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var tblTasks: UITableView!
    
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "JustDoIt✔️"
        self.tblTasks.tableFooterView = UIView()
        
        tasks = createTasks()
        
        tblTasks.dataSource = self
        tblTasks.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        if task.isImportant{
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else{
            cell.textLabel?.text = task.name
        }
        
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func createTasks() -> [Task] {
        var tasks: [Task] = []
        let task1 = Task(name: "Do laundry", isImportant: true)
        let task2 = Task(name: "Read a book", isImportant: false)
        let task3 = Task(name: "Buy fruits", isImportant: true)
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        return tasks
    }


}

