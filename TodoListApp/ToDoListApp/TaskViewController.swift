//
//  TaskViewController.swift
//  ToDoListApp
//
//  Created by bùi thành công on 06/05/2022.
//

import UIKit



class TaskViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var task: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    @objc func deleteTask(){
//        let newCont = count - 1
//        UserDefaults().setValue(newCont, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
//
    }

 

}
