//
//  ChatViewController.swift
//  ChatApp_Signal
//
//  Created by bùi thành công on 18/09/2022.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketIOManager.shared.connect()
        SocketIOManager.shared.socket.on("data", callback: {[weak self] responsea,_ in
            print(responsea)
        })
        configTableView()
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib1 = UINib(nibName: "CreateTableViewCell", bundle: nil)
        let nib2 = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "CreateTableViewCell")
        tableView.register(nib2, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    private func sendMessage(message:String){
        SocketIOManager.shared.socket.emit("send-message", with: ["\(message)"], completion: nil)
    }

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTableViewCell", for: indexPath) as! CreateTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            return cell
        }
    }
    
    
}
