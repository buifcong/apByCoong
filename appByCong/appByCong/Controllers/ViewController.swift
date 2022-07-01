//
//  ViewController.swift
//  appByCong
//
//  Created by bùi thành công on 15/06/2022.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var btLogOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        loginFirebase()
        btLogOut.layer.cornerRadius = 10
        btLogOut.layer.masksToBounds = true
       
    }
    func loginFirebase(){
        if FirebaseAuth.Auth.auth().currentUser != nil {
            let vc = LoginView()

            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
       
    @IBAction func tapOnLogOut(_ sender: Any) {
        try! Auth.auth().signOut()
            let vc = LoginView()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
    }
    



}

