//
//  AddTaskViewController.swift
//  JustDoIt
//
//  Created by Robo Atenaga on 6/26/17.
//  Copyright © 2017 Ogheneorobo. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var switchImp: UISwitch!
    @IBOutlet weak var txtName: UITextField!
    
    var previousVC = TaskListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addBlurEffect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addClicked(_ sender: Any) {
        let task = Task();
        task.name = txtName.text!
        task.isImportant = switchImp.isOn
        
        // Add task to list
        previousVC.tasks.append(task)
        previousVC.tblTasks.reloadData()
        
        // Automatically go back to previousVC after adding
        navigationController!.popViewController(animated: true)
    }
    
    func addBlurEffect(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        //set the frame for the blurView to be same with backgroundImage
        blurView.frame = backgroundImage.bounds
        //add blurView as subview to backgroundImage
        backgroundImage.addSubview(blurView)
    }


}
