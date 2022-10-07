//
//  SectionViewController.swift
//  demo
//
//  Created by bùi thành công on 13/07/2022.
//

import UIKit

class SectionViewController: UIViewController {
    var arr: [Book] = []
    var arr2: [profile] = []
    var arr3: [poster] = []
    var arr4: [updateType] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupTableView()
        bindData()
        
    }
    //MARK: REGISTER
    func setupTableView(){
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        let nib2 = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "HeaderTableViewCell")
        let nib3 = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "ProfileTableViewCell")
        let nib4 = UINib(nibName: "PosterTableViewCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "PosterTableViewCell")
        let nib5 = UINib(nibName: "UpdateTableViewCell", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: "UpdateTableViewCell")
    }
    func bindData(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "vi")
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        let dateString = dateFormatter.string(from: currentDate)
        
        
        let profile1 = profile(dateCurrent: "\(dateString)", days: "Hôm nay")
        arr2.append(profile1)
        let poster1 = poster(titleBig: "TRẢI NGHIỆM MỚI", titleSmall: "Thử thách đọc sách 30 ngày cùng Reavol ")
        arr3.append(poster1)
        let update1 = updateType(titleNameBook: "Chuyến dã ngoại của Lan va Diep", titleAuthor: "Edward B.Burger and Michale Mike")
        arr4.append(update1)
        
        
        let b1 = Book(img: "ic1", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b2 = Book(img: "ic2", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b3 = Book(img: "ic3", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        let b4 = Book(img: "ic4", nameBook: "Lịch sử giao thương", author: "Guy Spier", preview: "Phố Wall và câu chuyện của những nhà đầu tư")
        arr.append(b1)
        arr.append(b2)
        arr.append(b3)
        arr.append(b4)
        tableView.reloadData()
    }
    
    
    
}
extension SectionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arr.count
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
            let item = arr[indexPath.row]
            cell.itemA = item
            return cell
        } else {
            switch indexPath.row{
            case 0:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
                let item1 = arr2[0]
                cell1.item1 = item1
                Corner(view: [cell1], corner: 10)
                return cell1
            case 1:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "PosterTableViewCell") as! PosterTableViewCell
                let item = arr3[0]
                cell2.item2 = item
                Corner(view: [cell2], corner: 10)
                return cell2
            case 2:
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell") as! UpdateTableViewCell
                let item = arr4[0]
                cell3.item3 = item
                Corner(view: [cell3], corner: 10)
                return cell3
                
                
                
            default:
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell") as! UpdateTableViewCell
                let item = arr4[0]
                cell3.item3 = item
                Corner(view: [cell3], corner: 10)
                return cell3
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            return headerCell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 0
    }

}
