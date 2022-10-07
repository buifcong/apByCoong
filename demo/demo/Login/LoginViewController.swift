//
//  LoginViewController.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//
//{
//    "email": "phuccr84982@gmail.com",
//    "password": "123456",
//    "loginAgain": false,
//    "deviceKey": ""
//}
//let headers = ["Authorization" : "Bearer "+accessToken!+"",
//                  "Content-Type": "application/json"]


import UIKit
import Alamofire
class LoginViewController: UIViewController {
    var urlNotify = ""
    var token = ""
    var parameter: [String:Any] = [
        "email": "phuccr84982@gmail.com",
        "password": "123456",
        "loginAgain": false,
        "deviceKey": ""
    ]
//    var headers:HTTPHeaders = ["Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0OTQ1NCIsImlhdCI6MTY1ODEwOTk5NSwiZXhwIjoxNjU4NzE0Nzk1fQ.FQ-cXRX_rQEcIOoaMQNr3dw24G4HR10wIWLL3lPB-2Uwtic0LckDs7tPKjR5BBmotZNP-Ug9RkW1WX3BkUQg0A"
//    ]
    let headers: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0OTQ1NCIsImlhdCI6MTY1Nzk1OTIxMywiZXhwIjoxNjU4NTY0MDEzfQ.dMhaBfpTLmrn6iuMF_K-XWInaGXOXA1GSGlb8rCBtrWV6KCwoPG-zDqMXyqV6afOOfzcJBA2qKpD08KALAUovw")]
    var parameter2 = [
        "page": "0"
    ]
   
    var arrDataLogin: [Any] = []
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var viewNavi: UIView!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        design()
    }
    
    func design(){
        btLogin.clipsToBounds = true
        btLogin.layer.cornerRadius  = btLogin.frame.height/2
        Corner(view: [textFieldEmail,textFieldPassword], corner: 10)
        textFieldEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textFieldEmail.leftViewMode = .always
        textFieldPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textFieldPassword.leftViewMode = .always
    }
    func setupTextField(){
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case btRegister:
            //login
            let vc = RegisterViewController()
            navigationController?.pushViewController(vc, animated: true)
            
            break
        case btBack:
            break
        case btLogin:
            if textFieldEmail.text == "" || textFieldPassword.text == ""{
                let al = UIAlertController(title: "Woop!", message: "can you insert full information", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .default))
                present(al, animated: true)
                break
            }
            else if textFieldEmail.text?.validateEmail() == false{
                let al = UIAlertController(title: "Woop!", message: "Vui long nhập đúng email", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .default))
                present(al, animated: true)
                break
            }
            else{
                let al = UIAlertController(title: nil, message: "can you save Password", preferredStyle: .actionSheet)
                al.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
                    
                    if let url = URL(string: "https://api-dev.ungdungdocnhanh.com/api/v1/auth/signin"){
                        AF.request(url, method: .post, parameters: self.parameter, encoding: JSONEncoding.default).responseJSON(completionHandler: {response in
                            if let result = response.value as? [String:Any]{
                                if let result2 = result["data"] as? [String:Any]{
//                                    print(result2)
//                                    let a = Data(JSON: result2)
////                                    print(a?.email)
////                                    print(a?.accessToken)
//                                    self.token = a?.accessToken ?? ""
                                    self.getNotificationAccount()

                                }
                                
                            }
                        })
                    }
               
                }))
                al.addAction(UIAlertAction(title: "No save", style: .default, handler: { _ in
                    print("Login no save")
                }))
                al.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(al, animated: true)
                break
            }
            
        default:
            return
        }
    }
    func getNotificationAccount(){
        if let url2 = URL(string: "https://api-dev.ungdungdocnhanh.com/api/v1/notification/get-notification"){
            AF.request(url2, method: .get, parameters: parameter2,  headers: headers).responseJSON(completionHandler: {response in
                print(response.value)
            })
            
        }
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    
}

extension LoginViewController {
    
}

