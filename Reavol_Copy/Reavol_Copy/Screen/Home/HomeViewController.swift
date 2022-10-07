//
//  HomeViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 25/07/2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        designUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func designUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.top = 29
        let nib1 = UINib(nibName: "TopTitleTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "TopTitleTableViewCell")
        let nib2 = UINib(nibName: "ReadingBookTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "ReadingBookTableViewCell")
        let nib3 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "BannerTableViewCell")
        
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopTitleTableViewCell", for: indexPath) as! TopTitleTableViewCell
            return cell
        }
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadingBookTableViewCell", for: indexPath) as! ReadingBookTableViewCell
            return cell
        }
    }
    
    
}
