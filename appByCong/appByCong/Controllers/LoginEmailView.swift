import UIKit
import Firebase
import FirebaseAuth
class LoginEmailView: UIViewController {
    
    @IBOutlet weak var btForgotPassword: UIButton!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var imgBear: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        tfEmail.delegate = self
        tfPassword.delegate = self
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        imgBear.image = UIImage(named: "bear1")
    }
    func setUpDesign(){
        corner(view: tfEmail, corner: 30, border: 1)
        corner(view: tfPassword, corner: 30, border: 1)
        corner(view: btLogin, corner: 30, border: 0)
        tfEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfEmail.leftViewMode = .always
        tfPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        tfPassword.leftViewMode = .always
    }
    @IBAction func tapOnLogin(_ sender: Any) {
        imgBear.image = UIImage(named: "bear1")
        view.endEditing(true)
        if tfEmail.text == "" || tfPassword.text == "" {
            present(alertNotActSh(title: "Woop.", message: "Please, enter your account", action: "ok"), animated: true)
        }
        else {
            //login success
            Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { result, error in
                if error != nil{
                    self.present(alertNotActSh(title: "Woop.", message: error!.localizedDescription, action: "ok"), animated: true)
                }
                else {
                    //Login successfull
                    let al = UIAlertController(title: "well come", message: "Log In successfull", preferredStyle: .alert)
                    al.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                        let vc = ViewController()
                        vc.modalPresentationStyle = .overFullScreen
                        self.present(vc, animated: true)
                    }))
                    self.present(al, animated: false)
                    
                    
                    
                }
            }
        }
    }
    @IBAction func tapOnForgotPassword(_ sender: Any) {
    }
    
    
    
}
extension LoginEmailView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        imgBear.image = UIImage(named: "bear2")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        imgBear.image = UIImage(named: "bear1")
        return true
    }
}
