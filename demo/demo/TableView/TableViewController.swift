//
//  TableViewController.swift
//  demo
//
//  Created by bùi thành công on 12/07/2022.
//
import UIKit
import Alamofire
import ObjectMapper
class TableViewController: UIViewController {
    var arrDataType: [DataType] = []
    var arrImage: [String] = []
    var arrData:[Data2] = []
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        bindData()
        navigationController?.navigationBar.isHidden = true
        getDataFromAPI()
    }
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell2")
    }
    func bindData(){
        let dt1 = DataType(image: "image1", bigTitle: "Lịch sử giao thương", smallTitle: "Hạnh phúc lâu dài trong một thế giới đang thay", price: "190.000")
        let dt2 = DataType(image: "image2", bigTitle: "Lịch sử giao thương", smallTitle: "Hạnh phúc lâu dài trong một thế giới đang thay", price: "190.000")
        let dt3 = DataType(image: "image3", bigTitle: "Lịch sử giao thương", smallTitle: "Hạnh phúc lâu dài trong một thế giới đang thay", price: "190.000")
        arrDataType.append(dt1)
        arrDataType.append(dt2)
        arrDataType.append(dt3)
        tableView.reloadData()
    }
    func getDataFromAPI(){
        if let url = URL(string: "https://api-dev.ungdungdocnhanh.com/api/v1/article/get-categories"){
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON{ response in
                if let categoyResponse = response.value as? [String:Any]{
                    if let listData2 = categoyResponse["data"] as? [[String: Any]] {
                        let dt = [Data2](JSONArray: listData2) ?? []
//                        let a = Data2(JSON: <#T##[String : Any]#>)
                        for item in dt {
                            self.arrData.append(item)
                        }
                        self.tableView.reloadData()
                    }
                }
//                if let rs = response.value as? [Category]
//                if let categoryResponse = Category(JSON: response.value as? [String : Any] ?? ["a":"a"]){
//                    print(categoryResponse.data)
//                }

            }
        }
    }


 

}
extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2") as! CustomTableViewCell
        
//        cell.lbBig.text = arrData[indexPath.row].name
//        if let url = URL(string: arrData[indexPath.row].icon?.originUrl ?? ""), let data = try? Data(contentsOf: url) {
//            cell.imgBig.image = UIImage(data: data)
//        }
//        imageView.image = UIImage(data: data!)
        return cell
    }
    
}
