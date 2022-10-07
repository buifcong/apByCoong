//
//  CollectionViewController.swift
//  demo
//
//  Created by bùi thành công on 14/07/2022.
//

import UIKit
import Alamofire
class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let buyRTokenParameter: [String: Any] = ["type":"buyToken"]
    let bookParameter = ["page":"0"]
    var arrBook: [DataBook] = []
    var arrBuyRToken:[DataBuyRToken] = []
    let posterParameter = ["type":"buyVipWithToken"]
    var arrPoster:[DataBuyVipRToken] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        bindData()
        callDataFromAPI()
        navigationController?.navigationBar.isHidden = true
        
    }
    //MARK: REGISTER
    func setupCollectionView(){
        let nib1 = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "BookCollectionViewCell")
        let nib2 = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib2, forCellWithReuseIdentifier: "CustomCollectionViewCell")
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let nib3 = UINib(nibName: "HeaderCollectionViewCell", bundle: nil)
        collectionView.register(nib3, forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        let nib4 = UINib(nibName: "BuyRTokenCollectionViewCell", bundle: nil)
        collectionView.register(nib4, forCellWithReuseIdentifier: "BuyRTokenCollectionViewCell")
        let nib5 = UINib(nibName: "PosterCollectionViewCell", bundle: nil)
        collectionView.register(nib5, forCellWithReuseIdentifier: "PosterCollectionViewCell")
        let nib6 = UINib(nibName: "FullColorCollectionViewCell", bundle: nil)
        collectionView.register(nib6, forCellWithReuseIdentifier: "FullColorCollectionViewCell")
        
    }
    //MARK: BindData
    func bindData(){
//        let b1 = BookCollectionType(image: "collect1", price: "120.000", nameBook: "Tư duy tích cực để thanh cong")
//        let b2 = BookCollectionType(image: "collect2", price: "190.000 ", nameBook: "TNơi tận cùng trái đất la aasasdas")
//        let b3 = BookCollectionType(image: "collect3", price: "190.000 ", nameBook: "Nghệ thuật đọc")
//        let b4 = BookCollectionType(image: "collect4", price: "180.000 ", nameBook: "Tình yêu thương từ nguoi khac")
//        arrBook.append(b1)
//        arrBook.append(b2)
//        arrBook.append(b3)
//        arrBook.append(b4)
        collectionView.reloadData()
        
    }
    //MARK: Call data from API
    func callDataFromAPI(){
        //MARK: API buy RToken
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/payment/get-packages", method: .get, parameters: buyRTokenParameter, encoding:URLEncoding.default).responseJSON { response in
            if let result1 = response.value as? [String:Any]{
                if let result2 = result1["data"] as? [[String:Any]]{
                    self.arrBuyRToken = [DataBuyRToken](JSONArray: result2)
                        self.collectionView.reloadData()
                
                }
            }
        }
        
        //MARK: API Book Cell
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/article/get-weekly-hot-article", method: .get, parameters: bookParameter, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            if let result1 = response.value as? [String:Any]{
                if let result2 = result1["data"] as? [[String:Any]]{
                    self.arrBook = [DataBook](JSONArray: result2)
                    self.collectionView.reloadData()
                }
            }
        }
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/payment/get-packages", method: .get, parameters: posterParameter, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            if let result1 = response.value as? [String:Any] {
                if let result2 = result1["data"] as? [[String:Any]]{
                    self.arrPoster = [DataBuyVipRToken](JSONArray: result2)
                    self.collectionView.reloadData()
                }
            }
        }
    }

   
}
//MARK: collectionView ko dùng section
//extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 7
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.item {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
//            return cell
//        case 1:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
//            return cell
//        case 2...6:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
//            let item = arrBook[(indexPath.row-1)%4]
//            cell.itemCollectionBook = item
//            return cell
//
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
//            return cell
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.item == 0 {
//            return CGSize(width: collectionView.frame.size.width - 40, height: 183)
//        }
//        else if indexPath.item == 1 {
//            return CGSize(width: collectionView.frame.size.width - 40, height: 55)
//        } else {
//            let w = (collectionView.frame.width-50)/2
//            return CGSize(width: w, height: w+60)
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//
//
//
//}
//MARK: collectionView multiType
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //MARK: số section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    //MARK: số row trong mỗi section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return arrBuyRToken.count+1
        }else if section == 2 {
            return 3
        }else if section == 3 {
            return 2+arrBook.count
        }else{
            return 6
        }
    }
    //MARK: tạo cell trong section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
//            if indexPath.item == 0 {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullColorCollectionViewCell", for: indexPath) as! FullColorCollectionViewCell
//                return cell
//            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
                return cell
//            }
        }
        else if indexPath.section == 1 {
            if indexPath.item == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullColorCollectionViewCell", for: indexPath) as! FullColorCollectionViewCell
                return cell
            }else if indexPath.item == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
                cell.lbTitle.text = "Mua R Token"
                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyRTokenCollectionViewCell", for: indexPath) as! BuyRTokenCollectionViewCell
                let item = arrBuyRToken[indexPath.row-1]
                cell.item = item
                return cell
            }

        }
        else if indexPath.section == 2 {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullColorCollectionViewCell", for: indexPath)
                return cell
            }else if indexPath.item == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
                cell.lbTitle.text = "Ưu Đãi"
                return cell
            } else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as! PosterCollectionViewCell
                cell.arrPoster = arrPoster
                
                return cell
            }
            
        }
        else if indexPath.section == 3{
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullColorCollectionViewCell", for: indexPath)
                return cell
            } else if indexPath.item == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
                cell.lbTitle.text = "Truyện Hay"
                return cell
            } else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
                let item = arrBook[indexPath.row-2]
                cell.itemCollectionBook = item

                return cell
            }
        }
        else  {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
                cell.lbTitle.text = "Truyện Hay"
                return cell
            }
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
                let item = arrBook[indexPath.row-1]
                cell.itemCollectionBook = item

                return cell
            }
           
        }
    }
    //MARK: chiều cao chiều rộng cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.size.width, height: 181)
        }
//        if indexPath.section == 3 && indexPath.item == 0 {
//            return CGSize(width: view.frame.size.width, height: 50)
//        }
        if indexPath.section == 1  {
            if indexPath.item == 0{
                return CGSize(width: view.frame.size.width, height: 16)
            } else if indexPath.item == 1{
                return CGSize(width: view.frame.size.width-40, height: 50)
            } else{
                return CGSize(width: view.frame.size.width-40, height: 65)
            }
        }
        if indexPath.section == 2 {
            if indexPath.item == 0 {
                return CGSize(width: view.frame.size.width, height: 16)
            } else if indexPath.item == 1{
                return CGSize(width: view.frame.size.width-40, height: 50)
            } else{
                return CGSize(width: view.frame.size.width , height: (view.frame.size.width - 40)*145/335 + 30)
            }
            
        }
        if indexPath.section == 3 {
            if indexPath.item == 0 {
                return CGSize(width: view.frame.size.width , height: 16)
            }else if indexPath.item == 1{
                return CGSize(width: view.frame.size.width - 40, height: 65)
            } else{
                let w = (collectionView.frame.width-50)/2
                return CGSize(width: w, height: w+65)
            }
            
        }else {
            let w = (collectionView.frame.width-50)/2
            return CGSize(width: w, height: w+65)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return .init(top: 0, left: 20, bottom: 0, right: 20)
        }else if section == 2{
            return . init(top: 40, left: 0, bottom: 0, right: 0)
        }else if section == 1 {
            return . init(top: 40, left: 0, bottom: 0, right: 0)
        }
        else{
            return .init(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0{
            return 0
        } else if section == 1{
            return 16
        }else if section == 2{
            return 0
        }else if section == 3{
            return 0
        }else{
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
