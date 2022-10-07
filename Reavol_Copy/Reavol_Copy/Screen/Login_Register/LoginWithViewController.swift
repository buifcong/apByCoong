//
//  LoginWithViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 24/07/2022.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseCore
class LoginWithViewController: UIViewController {

    @IBOutlet weak var btnLoginAccount: UIButton!
    @IBOutlet weak var btnLoginGoogle: UIButton!
    @IBOutlet weak var btnLoginFacebook: UIButton!
    @IBOutlet weak var viewLoginGoogle: UIView!
    @IBOutlet weak var viewLoginFaceBook: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func designUI(){
        viewLoginFaceBook.layer.cornerRadius = viewLoginFaceBook.frame.height/2
        viewLoginFaceBook.clipsToBounds = true
        viewLoginGoogle.layer.cornerRadius = viewLoginGoogle.frame.height/2
        viewLoginGoogle.clipsToBounds = true
        viewLoginGoogle.layer.borderWidth = 1
        viewLoginGoogle.layer.borderColor = UIColor.gray.cgColor
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLoginGoogle:
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            showLoading(text: "")
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [weak self] user, err in
                if err != nil {
                    self?.hiddenLoading()
                    alertNoActionType(title: nil, message: err?.localizedDescription, titleAction: "ok")
                }
                guard let authentication = user?.authentication,let idToken = authentication.idToken else {
                    return
                }
                let credential = GoogleAuthProvider.credential(withIDToken:idToken,accessToken:authentication.accessToken)
                Auth.auth().signIn(with: credential) {authReusult, error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        let vc = TabbarViewController()
                        vc.modalPresentationStyle = .fullScreen
                        vc.modalTransitionStyle = .crossDissolve
                        self?.hiddenLoading()
                        self?.present(vc, animated: true)
                    }
                }
                
            }
            return
        case btnLoginFacebook:
            return
        case btnLoginAccount:
            navigationController?.pushViewController(LoginViewController(), animated: true)
            return
        default:
            return
        }
    }
    
  

}
