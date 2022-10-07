//
//  AccountViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 10/08/2022.
//

import UIKit
import FirebaseAuth
class AccountViewController: UIViewController {

    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var btnDeleteAccount: UIButton!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnLanguage: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    @IBOutlet weak var btnInforAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBlur.isHidden = true
    }
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnLogOut:
            let al = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            al.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
                do { try Auth.auth().signOut()
                    print("logout")
                    self.dismiss(animated: true)
                }
                catch { print("already logged out") }
            }))
            al.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(al, animated: true)
        default:
            let vc = UpdatingViewController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            vc.handleViewBur = {[weak self] in
                self?.viewBlur.isHidden = true
            }
            viewBlur.isHidden = false
            present(vc, animated: true)
        }
    }
}
