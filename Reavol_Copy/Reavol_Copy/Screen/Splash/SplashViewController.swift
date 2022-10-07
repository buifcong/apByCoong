//
//  SplashViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 10/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goToScreen()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    
    func goToScreen(){
        let user = Auth.auth().currentUser;
        if ((user) != nil) {
            let vc = TabbarViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc , animated: true)
        } else {
            let nav = UINavigationController(rootViewController: TrailerViewController())
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            present(nav, animated: true)
        }
    }

}
