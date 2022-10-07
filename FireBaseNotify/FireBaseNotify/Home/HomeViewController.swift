//
//  HomeViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 21/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLogin:
            navigationController?.pushViewController(LoginViewController(), animated: true)
            return
        case btnRegister:
            navigationController?.pushViewController(RegisterViewController(), animated: true)
            return
        
        default:
            return
        }
    }
}
