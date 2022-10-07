//
//  CreateBookViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 04/08/2022.
//

import UIKit
import FirebaseFirestore

class CreateBookViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var tfAuthor: UITextField!
    @IBOutlet weak var tfName: UITextField!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case btnAdd:
            if tfName.text == "" || tfPrice.text == "" || tfAuthor.text == "" {
                print("nhap thong tin")
                return
            }
            let book = Book(id: UUID().uuidString, name: tfName.text ?? "", author: tfAuthor.text ?? "", createAt: "\(Date())", price: Float(tfPrice.text ?? "0") ?? 0 )
            db.collection("books").addDocument(data:book.dictionary)
            navigationController?.pushViewController(ListBookViewController(), animated: true)
            return
        default:
            return
        }
    }
    
}
