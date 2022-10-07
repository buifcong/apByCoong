//
//  ListBookViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 04/08/2022.
//

import UIKit
import FirebaseFirestore
import Firebase

class ListBookViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrBook: [Book] = []
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromNote(note: "books")
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    func getDataFromNote(note:String){
        db.collection(note).getDocuments {[weak self] querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            for doc in querySnapshot!.documents {
                if let id = doc.data()["id"] as? String,
                   let name = doc.data()["name"] as? String,
                   let author = doc.data()["author"] as? String,
                   let createAt = doc.data()["createAt"] as? String,
                   let price = doc.data()["price"] as? Float {
                    let book = Book(id: id, name: name, author: author, createAt: createAt, price: price)
                    self?.arrBook.append(book)
                    
                }
            }
            self?.tableView.reloadData()
        }
    }
}
extension ListBookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrBook[indexPath.row].name
        cell.detailTextLabel?.text = arrBook[indexPath.row].author
        return cell
    }
    
    
}
