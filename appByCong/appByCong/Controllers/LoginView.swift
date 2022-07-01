//
//  LoginView.swift
//  appByCong
//
//  Created by bùi thành công on 15/06/2022.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginView: UIViewController {

    @IBOutlet weak var btSignUp: UIButton!
    @IBOutlet weak var btLoginWithFacebook: UIButton!
    @IBOutlet weak var btLoginWithEmail: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    func setUpDesign(){
        corner(view: btLoginWithEmail, corner: 30, border: 0)
        corner(view: btLoginWithFacebook, corner: 30, border: 0)
    }
    @IBAction func tapOnLoginWithEmail(_ sender: Any) {
        let vc = LoginEmailView()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tapOnLoginWithFacebook(_ sender: Any) {
    }
    @IBAction func tapOnSignUp(_ sender: Any) {
        let vc = RegisterEmailView()
        navigationController?.pushViewController(vc, animated: true)
    }
    


}
