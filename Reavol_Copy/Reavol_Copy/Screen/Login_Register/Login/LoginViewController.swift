//
//  LoginViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 24/07/2022.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPassWord: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tfPassWord: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func designUI(){
        btnLogin.clipsToBounds = true
        btnLogin.layer.cornerRadius = btnLogin.frame.height/2
        tfEmail.clipsToBounds = true
        tfEmail.layer.cornerRadius = 10
        tfPassWord.clipsToBounds = true
        tfPassWord.layer.cornerRadius = 10
        leftAndRightView(textField: [tfEmail,tfPassWord], x: 0, y: 0, width: 16, heigh: 0)
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLogin:
            showLoading(text: "")
            if tfEmail.text == "" || tfPassWord.text == "" {
                present(alertNoActionType(title: "Woops", message: "enter your information", titleAction: "Ok"), animated: true)
                hiddenLoading()
            } else {
                Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassWord.text!) {[weak self] result, error in
                    if let error = error  {
                        self?.hiddenLoading()
                        self?.present(alertNoActionType(title: "Woops", message: error.localizedDescription, titleAction: "Ok"), animated: true)
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
        case btnBack:
            navigationController?.popViewController(animated: true)
            return
        case btnRegister:
            navigationController?.pushViewController(RegisterViewController(), animated: true)
            return
        case btnForgotPassWord:
            return
        default:
            return
        }
    }
    
    

}
