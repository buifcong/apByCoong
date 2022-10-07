//
//  LoadMoreViewController.swift
//  demo
//
//  Created by bùi thành công on 19/07/2022.
//

import UIKit
import Alamofire
import ObjectMapper
class LoadMoreViewController: UIViewController {
    var check: Bool = true
    var inde: Int = 0
    @IBOutlet weak var tableView: UITableView!
    var arrBook:[LoadMoreBookData] = []
    var countData: Int = 0
  
    
//    var arrBookLoad:[LoadMoreBookData] = [] {
//        didSet{
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupTableView()
        getDataFromAPI()
        // Do any additional setup after loading the view.
    }
    func setupTableView(){
        tableView.separatorColor = .clear
        let nib1 = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "CustomTableViewCell")
        let nib2 = UINib(nibName: "CustomBarTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "CustomBarTableViewCell")
    }
    func getDataFromAPI(){
        let parameter = ["categoryId":"1","page":"\(inde)"] as! [String:AnyObject]
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/article/get-articles-in-category", method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            if let result1 = response.value as? [String:Any] {
                if let result2 = result1["data"] as? [[String:Any]]{
                    print("\(self.inde)")
                    self.arrBook += [LoadMoreBookData](JSONArray:result2) ?? []
                    self.check = true
                    self.tableView.reloadData()
                }
            }
        }
    }




}
extension LoadMoreViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomBarTableViewCell", for: indexPath) as! CustomBarTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
                let item = arrBook[indexPath.row-1]
                cell.item2 = item
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let line = scrollView.contentOffset.y

        if line > (tableView.contentSize.height-scrollView.frame.height){
            
            if countData != arrBook.count {
                inde += 1
                countData = arrBook.count
                check = false
                getDataFromAPI()
                
            }
        }
    }
    
    
    
}
