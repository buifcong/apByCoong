//
//  RegisterEmailView.swift
//  appByCong
//
//  Created by bùi thành công on 15/06/2022.
//

import UIKit
import Firebase
import FirebaseAuth
class RegisterEmailView: UIViewController {
    let arrSex: [String] = ["Male","Female"]
    @IBOutlet weak var pickerSex: UIPickerView!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfSex: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSex.isHidden = true
        setUpDesign()
        tfEmail.delegate = self
        tfPhoneNumber.delegate = self
        tfSex.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        pickerSex.delegate = self
        pickerSex.dataSource = self
        
    }
    func setUpDesign(){
        corner(view: tfEmail, corner: 30, border: 1)
        corner(view: tfPhoneNumber, corner: 30, border: 1)
        corner(view: tfSex, corner: 30, border: 1)
        corner(view: tfPassword, corner: 30, border: 1)
        corner(view: tfConfirmPassword, corner: 30, border: 1)
        corner(view: btRegister, corner: 30, border: 0)
        tfEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfEmail.leftViewMode = .always
        tfPhoneNumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfPhoneNumber.leftViewMode = .always
        tfSex.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfSex.leftViewMode = .always
        tfPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfPassword.leftViewMode = .always
        tfConfirmPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfConfirmPassword.leftViewMode = .always
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        btRegister.isHidden = false
        pickerSex.isHidden = true
    }
    @IBAction func tapOnRegister(_ sender: Any) {
        view.endEditing(true)
        if tfEmail.text == "" || tfPassword.text == "" || tfConfirmPassword.text == "" {
            present(alertNotActSh(title: "Woop.", message: "Please, enter your information", action: "ok"), animated: true)
        }
        else if tfPassword.text != tfConfirmPassword.text {
            present(alertNotActSh(title: "Woop.", message: "Confirm password isn't same password", action: "ok"), animated: true)
        }
        else {
            
            //MARK: Register successful =====================================
            Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { result, error in
                if error != nil {
                    self.present(alertNotActSh(title: "Woop.", message: error!.localizedDescription, action: "ok"), animated: true)
                    
                }
                else {
                    self.present(alertNotActSh(title: "successfull", message: "", action: "ok"), animated: true)
                }
            }
        }
    }
    
    
}
extension RegisterEmailView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfSex {
            btRegister.isHidden = true
            pickerSex.isHidden = false
            return false
        }
        else{
            return true
        }
    }
    
    
}
extension RegisterEmailView: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrSex.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrSex[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfSex.text = arrSex[row]
        pickerSex.isHidden = true
        btRegister.isHidden = false
    }
    
}
