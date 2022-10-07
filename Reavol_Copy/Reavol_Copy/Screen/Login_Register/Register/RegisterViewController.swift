//
//  RegisterViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 25/07/2022.
//

import UIKit
import FirebaseAuth
class RegisterViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tfPasswordConfirm: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func designUI(){
        cornerAndBorder(view: [btnRegister], corner: btnRegister.frame.height/2, border: false, borderWith: nil, borderColor: nil)
        cornerAndBorder(view: [tfEmail,tfName,tfPassword,tfPasswordConfirm], corner: 10, border: true, borderWith: nil, borderColor: nil)
        leftAndRightView(textField: [tfName,tfEmail,tfPassword,tfPasswordConfirm], x: 0, y: 0, width: 16, heigh: 0)
    }
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnBack:
            navigationController?.popViewController(animated: true)
            return
        case btnRegister:
            if tfEmail.text == "" || tfPassword.text == "" || tfName.text == "" || tfPasswordConfirm.text == "" {
                present(alertNoActionType(title: "Woops", message: "Enter your information", titleAction: "Ok"), animated: true)
            } else if tfPassword.text != tfPassword.text {
                present(alertNoActionType(title: "Woops", message: "Password confirm not the same", titleAction: "Ok"), animated: true)
            } else {
                showLoading(text: "")
                Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) {[weak self] result,error in
                    guard let strongSelf = self else {
                        return
                    }
                    if let error = error {
                        strongSelf.hiddenLoading()
                        strongSelf.present(alertNoActionType(title: "Woops", message: error.localizedDescription, titleAction: "Ok"), animated: true)
                    } else {
                        let vc = TabbarViewController()
                        vc.modalPresentationStyle = .fullScreen
                        strongSelf.hiddenLoading()
                        strongSelf.present(vc, animated: true)
                    }
                }
            }
            return
        default:
            return
        }
    }
}

