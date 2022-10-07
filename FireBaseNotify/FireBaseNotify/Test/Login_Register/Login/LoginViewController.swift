//
//  LoginViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 21/07/2022.
//

import UIKit
import Alamofire
import FirebaseAuth
import ObjectMapper
class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUser: UITextField!
    

    var bd:emailLogin?
    let param = ["email":"vietanhtran122@gmail.com","password":"vietanhtran" ]
    var urlToken: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
 
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        switch sender {
        case btnLogin:
            
            bd?.email = "vietanhtran21702@gmail.com"
            bd?.password = "vietanhtran2"
            if tfPassword.text == "" || tfUser.text == "" {
                let al = UIAlertController(title: "Woops", message: "Enter your full information", preferredStyle: .alert)
                al.addAction(UIAlertAction(title: "ok", style: .cancel))
                present(al, animated: true)
            } else {
                AF.request("http://192.168.1.231:8080/api/admin/v1/auth/signin", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
                    if let result = response.value as? [String:Any]{
//                        print(result)
                        if let result2 = result["body"] as? [String:Any] {
//                            self.urlToken = (result2["accessToken"] as? String) ?? ""
                            let vc = PustViewController()
                            vc.accessToken = (result2["accessToken"] as? String) ?? ""
                            vc.headers = [.authorization(bearerToken: "\(result2["accessToken"] as! String)")]
                            self.present(vc, animated: true)
                        }
                    }

                }
            }
            return
        default:
            return
        }
    }
        
}
