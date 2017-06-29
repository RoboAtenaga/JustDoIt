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
    
    var task = Task()
    var previousVC = TaskListViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task.isImportant{
            lblTask.text = "❗️\(task.name)"
        }
        else{
            lblTask.text = task.name
        }

    }

    @IBAction func completeClicked(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tblTasks.reloadData()
        // Automatically go back to previousVC after adding
        navigationController!.popViewController(animated: true)
    }
}
