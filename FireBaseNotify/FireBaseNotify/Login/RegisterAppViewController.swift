//
//  RegisterAppViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 27/07/2022.
//

import UIKit

class RegisterAppViewController: UIViewController {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"

        // Do any additional setup after loading the view.
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnRegister:
            //register
            return
        default:
            return
        }
    }
    
   

}
