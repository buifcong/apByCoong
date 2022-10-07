//
//  RegisterViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 21/07/2022.
//

import UIKit
import FirebaseAuth
class RegisterViewController: UIViewController {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsers: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        // Do any additional setup after loading the view.
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnRegister:
            if tfPassword.text == "" || tfUsers.text == "" {
                let al = UIAlertController(title: "Woops", message: "Enter your full information", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .cancel))
                present(al, animated: true)
            } else {
                Auth.auth().createUser(withEmail: tfUsers.text!, password: tfPassword.text!){ result,error in
                    if let error = error {
                        let al = UIAlertController(title: "Woops", message: error.localizedDescription, preferredStyle: .alert)
                        al.addAction(UIAlertAction(title: "ok", style: .cancel))
                        self.present(al, animated: true)
                    } else {
                        let al = UIAlertController(title: "Successful", message: "you can login with account", preferredStyle: .actionSheet)
                        al.addAction(UIAlertAction(title: "Login", style:.default , handler: { _ in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        al.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                        self.present(al, animated: true)
                    }
                }
            }
            
            return
        default:
            return
        }
    }
    


}
