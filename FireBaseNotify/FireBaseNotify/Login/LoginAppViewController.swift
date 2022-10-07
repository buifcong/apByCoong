//
//  LoginAppViewController.swift
//  FireBaseNotify
//
//  Created by bùi thành công on 27/07/2022.
//

import UIKit
import Alamofire
import ObjectMapper
class LoginAppViewController: UIViewController {
    var arrDataLoginAdmin:AdminBody?
    @IBOutlet weak var btnLoginWithAdmin: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        // Do any additional setup after loading the view.
    }

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLogin:
            //Login
            if tfEmail.text == "" || tfPassword.text == "" {
                return
            } else {
                let param = ["email":tfEmail!.text,"password":tfPassword!.text ]
                
                return
            }
        case btnLoginWithAdmin:
            if tfEmail.text == "" || tfPassword.text == "" {
                return
            } else {
                let paramLoginWithAd = ["email":tfEmail!.text,"password":tfPassword!.text ]
                AF.request("http://192.168.1.231:8080/api/admin/v1/auth/signin", method: .post, parameters: paramLoginWithAd, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
                    if let result1 = response.value as? [String:Any] {
                        print(result1)
                        if let result2 = result1["body"] as? [String:Any]{
                            print(result2)
//                            self.arrDataLoginAdmin = result2
                        }
                    }
                }
                return
            }
           
        default:
            return
        }
    }
    

}
