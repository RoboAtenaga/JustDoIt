//
//  CompleteTaskViewController.swift
//  JustDoIt
//
//  Created by Robo Atenaga on 6/29/17.
//  Copyright © 2017 Ogheneorobo. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var lblTask: UILabel!
    
    //var task = Task()
    //var previousVC = TaskListViewController()
    
    var task : Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if task.isImportant{
//            lblTask.text = "❗️\(task.name!)"
//        }
//        else{
//            lblTask.text = task.name
//        }
        
        if task!.isImportant{
            lblTask.text = "❗️\(task!.name!)"
        }
        else{
            lblTask.text = task!.name
        }

    }

    @IBAction func completeClicked(_ sender: Any) {
        // Deleting without CoreData
//        previousVC.tasks.remove(at: previousVC.selectedIndex)
//        previousVC.tblTasks.reloadData()
        // Automatically go back to previousVC after adding
        
        // Deleting with CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
