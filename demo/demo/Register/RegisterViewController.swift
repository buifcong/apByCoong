//
//  RegisterViewController.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var viewNavi: UIView!

    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var tfConfirmPass: UITextField!
    @IBOutlet weak var tfPas: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        design()

        
    }
    override func viewDidLayoutSubviews() {
        
    }
    func design(){
        btRegister.clipsToBounds = true
        btRegister.layer.cornerRadius = btRegister.frame.height/2
        Corner(view: [tfName,tfEmail,tfPas,tfConfirmPass], corner: 10)
        tfEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfEmail.leftViewMode = .always
        tfPas.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfPas.leftViewMode = .always
        tfName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfName.leftViewMode = .always
        tfConfirmPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfConfirmPass.leftViewMode = .always
//        designTextField(view: [tfEmail,tfPas,tfName,tfConfirmPass], pixel: 10)
    }
    
    @IBAction func Action(_ sender: UIButton) {
        switch sender {
        case btBack:
            navigationController?.popViewController(animated: true)
            break
        case btRegister:
            if tfName.text == "" || tfEmail.text == "" || tfPas.text == "" || tfConfirmPass.text == ""{
                let al = UIAlertController(title: "Woop!", message: "can you insert full information", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .default))
                present(al, animated: true)
             break
            }
            else if tfEmail.text?.validateEmail() == false{
                let al = UIAlertController(title: "Woop!", message: "Vui long nhập đúng email", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .default))
                present(al, animated: true)
                break
            }
            else if tfPas.text != tfConfirmPass.text {
                let al = UIAlertController(title: "Woop!", message: "Password confirm isnt the same password", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .default))
                present(al, animated: true)
                break
            }
            else {
                let al = UIAlertController(title: "Successfull", message: nil, preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "OK", style: .default))
                present(al, animated: true)
                break
            }
            
        default:
            return
        }
    }
    

 

}
